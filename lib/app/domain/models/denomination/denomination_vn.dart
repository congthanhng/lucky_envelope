import 'package:lucky_envolope/app/presentation/resources/values/constants.dart';

import 'denomination.dart';

class DenominationVN {
  static Map<String, Denomination> get getDefault => <String, Denomination>{
        Constants.vnd_500: Denomination(name: Constants.vnd_500, value: 500),
        Constants.vnd_1k: Denomination(name: Constants.vnd_1k, value: 1000),
        Constants.vnd_2k: Denomination(name: Constants.vnd_2k, value: 2000),
        Constants.vnd_5k: Denomination(name: Constants.vnd_5k, value: 5000),
        Constants.vnd_10k: Denomination(name: Constants.vnd_10k, value: 10000),
        Constants.vnd_20k: Denomination(name: Constants.vnd_20k, value: 20000),
        Constants.vnd_50k: Denomination(name: Constants.vnd_50k, value: 50000),
        Constants.vnd_100k:
            Denomination(name: Constants.vnd_100k, value: 100000),
        Constants.vnd_200k:
            Denomination(name: Constants.vnd_200k, value: 200000),
        Constants.vnd_500k:
            Denomination(name: Constants.vnd_500k, value: 500000),
      };
}
