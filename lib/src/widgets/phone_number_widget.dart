import 'package:flutter/material.dart';
import 'package:udevs_phone_number/src/models/country.dart';
import 'package:udevs_phone_number/src/models/country_mask.dart';

import 'masked_textinput_formatter.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  List<Country> countries = [];
  MaskedTextInputFormatter? formatter;
  Country? selectedCountry;

  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var element in CountryMask.countryMask) {
      countries.add(
        Country(
          name: element['name'],
          code: element['code'],
          phoneCode: element['phoneCode'],
          flag: element['flag'],
          mask: element['mask'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        if (value.length == 3) {
          for (var country in countries) {
            if (value.contains(country.phoneCode)) {
              formatter = MaskedTextInputFormatter(
                mask: country.mask
                    .replaceAll("{", "")
                    .replaceAll("}", "")
                    .replaceAll("+", ""),
                separator: ' ',
              );
              selectedCountry = country;
              setState(() {});
            }
          }
        }
        if (value.length == 4) {
          for (var country in countries) {
            if (value.contains(country.phoneCode)) {
              formatter = MaskedTextInputFormatter(
                mask: country.mask
                    .replaceAll("{", "")
                    .replaceAll("}", "")
                    .replaceAll("+", ""),
                separator: ' ',
              );
              selectedCountry = country;
              setState(() {});
            }
          }
        }
      },
      inputFormatters: [
        if (formatter != null) formatter!,
      ],
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        prefixText: "+",
        prefixIcon: selectedCountry != null
            ? Image(
                image: AssetImage(
                  'assets/flags/${selectedCountry!.code.toLowerCase()}.png',
                  package: 'udevs_phone_number',
                ),
                width: 32,
                height: 32,
              )
            : null,
      ),
    );
  }
}
