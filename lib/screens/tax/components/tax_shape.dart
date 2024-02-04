import 'package:coding_challenge/screens/tax/model/tax_country.dart';
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:coding_challenge/shared/widgets/bottom_modal.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/countries_constants.dart';

class TaxShape extends StatefulWidget {
  const TaxShape({Key? key}) : super(key: key);

  @override
  State<TaxShape> createState() => _TaxShapeState();
}

class _TaxShapeState extends State<TaxShape> {
  bool _isChecked = false;
  List<CountryTaxID> entries = [CountryTaxID()];
  List<String> filteredContries = List.empty(growable: true);

  List<String> items = CountriesConstants.nationality
      .map((country) => country['label'] as String)
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 180,
                    child: SvgPicture.asset('assets/CryingGirl.svg')),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 210,
                  child: Text(
                    'Uh-Oh!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'We need your tax data in order for you to access your account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                    ),
                    onPressed: () async {
                      _showTaxDataInoutFields(context);
                    },
                    child: Container(
                      height: 32,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: const Text(
                        'UPDATE YOUR TAX DATA',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _showTaxDataInoutFields(BuildContext context) {
    ButtomModal(
      context: context,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          // Function to add a new entry
          void addNewEntry() {
            setModalState(() {
              entries.add(CountryTaxID());
            });
          }

          // Function to remove an entry
          void removeEntry(int index) {
            setModalState(() {
              if (entries.length > 1) {
                entries.removeAt(index);
              }
            });
          }

          return ListView(
            children: <Widget>[
              const SizedBox(height: 16),
              const Text(
                'Declaration of financial information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ListView.builder(itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 300,
                  child: _buildTaxForm(
                      this.context, index, removeEntry, setModalState),
                );
              }),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  addNewEntry();
                },
                child: Row(
                  children: [
                    Icon(Icons.add, color: Theme.of(context).colors.primary),
                    const SizedBox(width: 4),
                    Text(
                      'ADD ANOTHER',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Theme.of(context).colors.primary,
                    side: BorderSide(
                      color: Theme.of(context).colors.primary,
                      width: 1.5,
                    ),
                    value: _isChecked,
                    onChanged: (bool? isChecked) {
                      setState(() {
                        _isChecked = isChecked!;
                      });
                    },
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'I confirm above tax residency .',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colors.primary,
                  ),
                  onPressed: () async {
                    print("entries");
                    print(entries.toList());
                  },
                  child: Container(
                    height: 24,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colors.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTaxForm(BuildContext context, int index, Function removEntry,
      StateSetter setModalState) {
    InputDecoration inputDecoration = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        const Text(
          'WHICH COUNTRY SERVERS AS PRIMARY TAX RESIDENCY*',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.left,
        ),
        Builder(builder: (context) {
          filteredContries = getFilteredCountries();
          return DropdownSearch<String>(
            items: filteredContries,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration,
            ),
            onChanged: (value) {
              setModalState(() {
                entries[index].country = value ?? items[0];
              });
            },
            selectedItem: entries[index].country != ''
                ? entries[index].country
                : filteredContries[0],
            popupProps: const PopupProps.modalBottomSheet(
/*             title: Text("Test"), */
              showSearchBox: true,
            ),
          );
        }),
        const SizedBox(height: 16),
        const Text(
          'TAX IDENTIFICATION NUMBER*',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 4),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          initialValue: 'Tax ID or N/A',
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: inputDecoration,
          onChanged: (taxId) {
            setModalState(() {
              entries[index].taxId = taxId;
            });
          },
        ),
        const SizedBox(height: 4),
        index != 0
            ? Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    removEntry(index);
                  },
                  child: const Text(
                    "REMOVE",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              )
            : const SizedBox(height: 4),
        const SizedBox(height: 16),
      ],
    );
  }

/*   void _addNewEntry() {
    print("Called");
    setState(() {
      entries.add(CountryTaxID());
    });
  } */

  List<String> getFilteredCountries() {
    // Create a set of excluded country names for efficient lookup
    Set<String> excludedCountryNames = entries.map((e) => e.country).toSet();

    // Filter out countries that are in the excludedCountryNames set
    return items
        .where((country) => !excludedCountryNames.contains(country))
        .toList();
  }
}
