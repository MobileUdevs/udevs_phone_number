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
              print("mask  ${country.mask}");
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
              print("mask  ${country.mask}");
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

        print(value);
      },
      inputFormatters: [
        if (formatter != null) formatter!,

        // MaskedTextInputFormatter(mask: "+000 00 000 00 00", separator: " ")
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
        // suffixIcon: DropdownButton<Country>(
        //   underline: const SizedBox(),
        //   icon: const Icon(Icons.arrow_drop_down),
        //   iconSize: 24,
        //   elevation: 16,
        //   style: const TextStyle(color: Colors.deepPurple),
        //   onChanged: (Country? newValue) {
        //     setState(() {
        //       _controller.text = newValue!.phoneCode;
        //     });
        //   },
        //   items: countries.map<DropdownMenuItem<Country>>((Country value) {
        //     return DropdownMenuItem<Country>(
        //       value: value,
        //       child: Row(
        //         children: [
        //           Image.asset(
        //             "assets/flags/${value.code.toLowerCase()}.png",
        //             package: 'udevs_phone_number',
        //             width: 32,
        //             height: 32,
        //           ),
        //           const SizedBox(width: 8),
        //           Text(value.name),
        //         ],
        //       ),
        //     );
        //   }).toList(),
        // ),
      ),
    );
  }
}
