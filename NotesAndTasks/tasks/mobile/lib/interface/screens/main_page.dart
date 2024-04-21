import 'package:app_with_apps/constants/exports/exports.dart';
import 'package:app_with_apps/constants/localization/text.dart';
import 'package:app_with_apps/interface/routes/app_routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.mainPage),
                child: Text(ConstantText.notes)),
          ],
        ),
      ),
    );
  }
}
