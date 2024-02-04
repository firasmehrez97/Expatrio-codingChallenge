import 'package:coding_challenge/screens/tax/model/tax_country.dart';
import 'package:coding_challenge/screens/tax/services/tax_service.dart';
import 'package:coding_challenge/shared/countries_constants.dart';
import 'package:coding_challenge/shared/decorations/input_decoration.dart';
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TaxModalSheet extends StatefulWidget {
  final TaxModel taxmodel;

  const TaxModalSheet({
    Key? key,
    required this.taxmodel,
  }) : super(key: key);

  @override
  State<TaxModalSheet> createState() => _TaxModalSheetState();
}

class _TaxModalSheetState extends State<TaxModalSheet> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool checkboxError = false;

  List<String> filteredContries = List.empty(growable: true);

  List<String> countryItem = CountriesConstants.nationality
      .map((country) => country['label'] as String)
      .toList();

  List<String> getFilteredCountries() {
    // Create a set of excluded country names for efficient lookup
    List<String?>? excludedCountryNames = widget.taxmodel.secondaryTaxResidence
        ?.map((e) => CountriesConstants.getLabelByCode(e.country))
        .toList();

    // Filter out countries that are in the excludedCountryNames set
    if (excludedCountryNames == null) {
      return countryItem;
    } else {
      return countryItem
          .where((country) => !excludedCountryNames.contains(country))
          .where((country) =>
              CountriesConstants.getLabelByCode(
                  widget.taxmodel.primaryTaxResidence!.country) !=
              country)
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();

    widget.taxmodel.secondaryTaxResidence ??=
        List<TaxResidence>.empty(growable: true);
    widget.taxmodel.primaryTaxResidence ??= TaxResidence(country: '', id: '');
  }

  Widget _buildPrimaryTaxForm() {
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
        DropdownSearch<String>(
          items: filteredContries,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: inputDecoration,
          ),
          onChanged: (value) {
            setState(() {
              widget.taxmodel.primaryTaxResidence?.country =
                  CountriesConstants.getCodeByLabel(value ?? '');
            });
          },
          autoValidateMode: AutovalidateMode.always,
          validator: (item) {
            if (item == null || item == '') {
              return 'Please choose a country';
            }
            return null;
          },
          selectedItem: (widget.taxmodel.primaryTaxResidence?.country != '' &&
                  widget.taxmodel.primaryTaxResidence?.country != null)
              ? CountriesConstants.getLabelByCode(
                  widget.taxmodel.primaryTaxResidence!.country)
              : null,
          popupProps: PopupProps.modalBottomSheet(
              showSearchBox: true,
              modalBottomSheetProps: const ModalBottomSheetProps(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              )),
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: "Search for country",
                ),
              ),
              title: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(65, 171, 158, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ),
        const SizedBox(height: 16),
        const Text(
          'PRIMARY TAX IDENTIFICATION NUMBER*',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 4),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          initialValue: widget.taxmodel.primaryTaxResidence?.id ?? "N/A",
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: inputDecoration,
          onChanged: (taxId) {
            setState(() {
              widget.taxmodel.primaryTaxResidence?.id = taxId;
            });
          },
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildSecondaryTaxForm(
      BuildContext context, int index, Function removEntry) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        const Text(
          'WHICH COUNTRY SERVERS AS SECONDARY TAX RESIDENCY*',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.left,
        ),
        DropdownSearch<String>(
          items: filteredContries,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: inputDecoration,
          ),
          onChanged: (value) {
            setState(() {
              widget.taxmodel.secondaryTaxResidence?[index].country =
                  CountriesConstants.getCodeByLabel(value ?? countryItem[0]);
            });
          },
          autoValidateMode: AutovalidateMode.always,
          validator: (item) {
            if (item == null || item == '') {
              return 'Please choose a country';
            }
            return null;
          },
          selectedItem:
              (widget.taxmodel.secondaryTaxResidence?[index].country != '' ||
                      widget.taxmodel.secondaryTaxResidence?[index].country !=
                          null)
                  ? CountriesConstants.getLabelByCode(
                      widget.taxmodel.secondaryTaxResidence![index].country)
                  : null,
          popupProps: PopupProps.modalBottomSheet(
              showSearchBox: true,
              modalBottomSheetProps: const ModalBottomSheetProps(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              )),
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: "Search for country",
                ),
              ),
              title: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(65, 171, 158, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ),
        const SizedBox(height: 16),
        const Text(
          'SECONDARY TAX IDENTIFICATION NUMBER*',
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 4),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          initialValue: widget.taxmodel.secondaryTaxResidence![index].id,
          style: const TextStyle(fontSize: 16),
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: inputDecoration,
          onChanged: (taxId) {
            setState(() {
              widget.taxmodel.secondaryTaxResidence?[index].id = taxId;
            });
          },
        ),
        const SizedBox(height: 4),
        Align(
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
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void addNewEntry() {
    setState(() {
      widget.taxmodel.secondaryTaxResidence
          ?.add(TaxResidence(country: '', id: ''));
    });
  }

  void removeEntry(int index) {
    setState(() {
      if (widget.taxmodel.secondaryTaxResidence?.isNotEmpty == true) {
        widget.taxmodel.secondaryTaxResidence?.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    filteredContries = getFilteredCountries();
    return Form(
      key: _formKey,
      child: Builder(builder: (context) {
        if (widget.taxmodel.secondaryTaxResidence?.isEmpty == true) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Declaration of financial information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              _buildPrimaryTaxForm(),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      addNewEntry();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add,
                            color: Theme.of(context).colors.primary),
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
                            width: 2,
                            color: checkboxError
                                ? Colors.red
                                : const Color.fromRGBO(65, 171, 158, 1)),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                      ),
                      onPressed: () => onSaveButtonClick(),
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
              )
            ],
          );
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: widget.taxmodel.secondaryTaxResidence?.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    if (index == 0)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Declaration of financial information',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (index == 0) _buildPrimaryTaxForm(),
                    const SizedBox(
                      height: 5,
                    ),
                    _buildSecondaryTaxForm(this.context, index, removeEntry),
                    if (widget.taxmodel.secondaryTaxResidence != null)
                      if (index ==
                          (widget.taxmodel.secondaryTaxResidence!.length - 1))
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                addNewEntry();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add,
                                      color: Theme.of(context).colors.primary),
                                  const SizedBox(width: 4),
                                  Text(
                                    'ADD ANOTHER',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Theme.of(context).colors.primary),
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
                                      width: 2,
                                      color: checkboxError
                                          ? Colors.red
                                          : const Color.fromRGBO(
                                              65, 171, 158, 1)),
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
                                  backgroundColor:
                                      Theme.of(context).colors.primary,
                                ),
                                onPressed: () => onSaveButtonClick(),
                                child: Container(
                                  height: 24,
                                  width: 250,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colors.primary,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                  ),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )),
                          ],
                        )
                  ],
                );
              });
        }
      }),
    );
  }

  Future<void> onSaveButtonClick() async {
    if (!_isChecked) {
      setState(() {
        checkboxError = true;
      });
    } else if (_formKey.currentState!.validate()) {
      await TaxService.updateData(widget.taxmodel, context);
    }
  }
}
