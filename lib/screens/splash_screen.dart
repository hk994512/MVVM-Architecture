import 'package:flutter/material.dart';
import '/repository/movies_repo.dart';
import '/screens/movies_screen.dart';
import '/service/init_getit.dart';
import '/service/navigation_service.dart';
import '/widgets/my_error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false;
  String _errorMessage = '';
  final _movieRepo = getIt<MoviesRepository>();
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      await _movieRepo.fetchGenres();
      await getIt<NavigationService>().navigateReplace(MoviesScreen());
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('LOADING.....'),
                    SizedBox(height: 15),
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              )
              : MyErrorWidget(
                errorText: _errorMessage,
                retryFunction: () => _loadData(),
              ),
    );
  }
}
