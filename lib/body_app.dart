import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_api/model/bitcoin_entity.dart';
import 'package:test_api/services/api_service.dart';
import 'package:test_api/services/color_generate_service.dart';
import 'package:test_api/widgets/coin_card_widget.dart';

class BodyApp extends StatefulWidget {
  const BodyApp({super.key});

  @override
  State<BodyApp> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  final List<BitcoinEntity?> _data = [];
  final ScrollController _scrollController = ScrollController();
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    setState(() {
      _data.addAll(_data.skip(_currentIndex).take(15));
      _currentIndex + 15;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Правильнее использовать Bloc - но для этого нужно больше времени)
    return FutureBuilder<List<BitcoinEntity?>>(
      future: ApiService().fetchData(),
      builder: (context, snapshot) {
        if (snapshot.data?.isNotEmpty == true) {
          _data.addAll(snapshot.data!.take(20));
          return ListView.builder(
            controller: _scrollController,
            itemCount: _data.length,
            itemBuilder:
                (context, index) => CoinCardWidget(
                  description: _data[index]?.symbol ?? 'no data',
                  color: ColorGenerateService.generateRandomColor(),
                  price: _data[index]?.rateUsd.toString() ?? '0',
                ),
          );
        } else {
          return const Center(child: Text('no data'));
        }
      },
    );
  }
}
