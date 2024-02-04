import 'package:coding_challenge/screens/tax/components/tax_modal_sheet.dart';
import 'package:coding_challenge/screens/tax/model/tax_country.dart';
import 'package:coding_challenge/screens/tax/services/tax_service.dart';
import 'package:coding_challenge/shared/utils/extensions/theme_data_extension.dart';
import 'package:coding_challenge/shared/widgets/bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaxShape extends StatefulWidget {
  const TaxShape({Key? key}) : super(key: key);

  @override
  State<TaxShape> createState() => _TaxShapeState();
}

class _TaxShapeState extends State<TaxShape> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SvgPicture.asset('assets/CryingGirl.svg'),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
                onPressed: () async {
                  var taxModel = await TaxService.getTaxData();
                  _showTaxDataInoutFields(context, taxModel!);
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
    );
  }

  void _showTaxDataInoutFields(BuildContext context, TaxModel taxModel) {
    ButtomModal(
      context: context,
      child: TaxModalSheet(
        taxmodel: taxModel,
      ),
    );
  }
}
