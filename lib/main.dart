import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/feature/auth/login/presentation/provider/login_provider.dart';
import 'package:foto_in/feature/auth/login/presentation/view/login_view.dart';
import 'package:foto_in/feature/auth/presentation/auth_view.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/view/register_view.dart';
import 'package:foto_in/feature/booking/presentation/view/booking_view.dart';
import 'package:foto_in/feature/booking/presentation/widgets/booking_widgets.dart';
import 'package:foto_in/feature/booking_detail/presentation/presentation/booking_detail_provider.dart';
import 'package:foto_in/feature/booking_detail/presentation/view/booking_detail_view.dart';
import 'package:foto_in/feature/fotografer/presentation/view/fotografer_detail_view.dart';
import 'package:foto_in/feature/galeri/galeri_details/full_screen_photo/presentation/view/full_screen_photo_view.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/view/galeri_details_view.dart';
import 'package:foto_in/feature/galeri/presentation/view/galeri_view.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/galeri_card.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/widgets/galeri_details_widgets.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/galeri_widgets.dart';
import 'package:foto_in/feature/home/presentation/view/beranda.dart';
import 'package:foto_in/feature/home/presentation/widgets/mobile/home_widgets.dart';
import 'package:foto_in/feature/navigation/presentation/view/mobile/navigation_bar.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/view/order_user_detail_view.dart';
import 'package:foto_in/feature/order_user/presentation/view/order_user_detail_view.dart';
import 'package:foto_in/feature/order_user/presentation/view/user_order_view.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/user_order_web.dart';
import 'package:foto_in/feature/payment/presentation/view/payment_view.dart';
import 'package:foto_in/feature/payment/presentation/widgets/payment_widgets.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/view/add_portofolio_view.dart';
import 'package:foto_in/feature/profile/register_photographer/provider/register_photographer_provider.dart';
import 'package:foto_in/feature/profile/register_photographer/view/register_photographer_view.dart';
import 'package:foto_in/feature/profile/presentation/view/profile_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

final SecureStorage secureStorage = SecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Auth
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        // ChangeNotifierProvider(
        //     create: (context) => RegisterProvider(
        //           secureStorage: secureStorage,
        //         )),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BookingDetailProvider()),
        ChangeNotifierProvider(
            create: (context) => RegisterPhotographerProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backgroundPrimary,
          primarySwatch: AppColor.primary,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.backgroundPrimary,
            foregroundColor: AppColor.textPrimary,
            titleTextStyle: FotoInHeadingTypography.xSmall(
              color: AppColor.textPrimary,
            ),
          ),
        ),
        routes: {
          // Auth
          AuthView.routeName: (context) => const AuthView(),
          LoginView.routeName: (context) => const LoginView(),
          RegisterView.routeName: (context) => const RegisterView(),

          // Home
          NavigationBarMobile.routeName: (context) =>
              const NavigationBarMobile(),
          Beranda.routeName: (context) => const Beranda(),

          // Fotografer Detail
          FotograferDetailView.routeName: (context) =>
              const FotograferDetailView(),

          // Booking
          BookingView.routeName: (context) => const BookingView(),
          OrderUserDetailView.routeName: (context) =>
              const OrderUserDetailView(),

          // Portofolio
          ProfileView.routeName: (context) => const ProfileView(),
          RegisterPhotographer.routeName: (context) =>
              const RegisterPhotographer(),
          AddPortofolioView.routeName: (context) => const AddPortofolioView(),

          // Galeri
          GaleriView.routeName: (context) => const GaleriView(),
          GaleriDetailsView.routeName: (context) => const GaleriDetailsView(),
          FullScreenPhotoView.routeName: (context) =>
              const FullScreenPhotoView(),

          // Booking
          OderDetailUserView.routeName: (context) => const OderDetailUserView(),
          UserOrderView.routeName: (context) => const UserOrderView(),
          PaymentView.routeName: (context) => const PaymentView(),
        },
        title: 'Flutter Demo',
        home: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          body: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return const Beranda();
              } else {
                // return const NavigationBarMobile();
                return AuthView();
              }
            },
          ),
        ),
      ),
    );
  }
}
