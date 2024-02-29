import 'package:codeli/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:codeli/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.splash), fit: BoxFit.cover),
          gradient: AppGradients.linear,
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.linear,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(AppImages.logo),
                  Text(
                    "NEWS",
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        letterSpacing: 6,
                        color: AppColors.white),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
