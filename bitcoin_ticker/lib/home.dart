import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';

const ButtonStyle kbuttonMainStyle = ButtonStyle(
  minimumSize: MaterialStatePropertyAll(
    Size.fromHeight(60),
  ),
  backgroundColor: MaterialStatePropertyAll(
    Colors.lightBlue,
  ),
);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late var currencyData = [];
  String coin = "AUD";
  List<dynamic> conversion = [41316, 2476, 100];
  final List<DropdownMenuEntry<dynamic>> currencies =
      <DropdownMenuEntry<dynamic>>[];

  void loadCurrencies() {
    for (final currency in currenciesList) {
      currencies
          .add(DropdownMenuEntry<dynamic>(value: currency, label: currency));
    }
  }

  Future getCoinData() async {
    currencyData = await CoinData.getCoinData();
    setState(() {
      loadCoinConversion();
    });
  }

  void loadCoinConversion() {
    conversion = CoinData.getCurrencyChange(currencyData, coin);
  }

  @override
  void initState() {
    getCoinData();
    loadCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "🤑 Coin Ticker",
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: kbuttonMainStyle,
                    child: Text(
                      "1 BTC = ${conversion[0]} $coin",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: kbuttonMainStyle,
                    child: Text(
                      "1 ETH = ${conversion[1]} $coin",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: kbuttonMainStyle,
                    child: SizedBox(
                      child: Text(
                        "1 LTC = ${conversion[2]} $coin",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.lightBlue,
              child: Center(
                child: DropdownMenu(
                  menuHeight: 600,
                  initialSelection: currencies[0].value,
                  dropdownMenuEntries: currencies,
                  inputDecorationTheme:
                      const InputDecorationTheme(border: InputBorder.none),
                  onSelected: (value) {
                    setState(() {
                      coin = value;
                    });
                    loadCoinConversion();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
