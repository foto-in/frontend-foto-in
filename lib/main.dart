import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/feature/auth/login/presentation/provider/login_provider.dart';
import 'package:foto_in/feature/auth/login/presentation/view/login_view.dart';
import 'package:foto_in/feature/auth/presentation/auth_view.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/view/register_view.dart';
import 'package:foto_in/feature/booking/presentation/view/booking_view.dart';
import 'package:foto_in/feature/booking_detail/presentation/presentation/booking_detail_provider.dart';
import 'package:foto_in/feature/fotografer/presentation/view/fotografer_detail_view.dart';
import 'package:foto_in/feature/galeri/galeri_details/full_screen_photo/presentation/view/full_screen_photo_view.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/view/galeri_details_view.dart';
import 'package:foto_in/feature/galeri/presentation/view/galeri_view.dart';
import 'package:foto_in/feature/home/presentation/view/beranda.dart';
import 'package:foto_in/feature/navigation/presentation/view/mobile/navigation_bar.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/presentation/view/order_fotografer_detail_view.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/upload_hasil/presentation/view/upload_hasil_view.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/upload_preview/presentation/view/upload_preview_view.dart';
import 'package:foto_in/feature/order_fotografer/presentation/view/fotografer_order_view.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/view/order_user_detail_view.dart';
import 'package:foto_in/feature/order_user/order_user_detail/preview/presentation/view/preview_view.dart';
import 'package:foto_in/feature/order_user/presentation/view/order_user_detail_view.dart';
import 'package:foto_in/feature/order_user/presentation/view/user_order_view.dart';
import 'package:foto_in/feature/payment/presentation/view/payment_view.dart';
import 'package:foto_in/feature/portofolio/presentation/view/portofolio_view.dart';
import 'package:foto_in/feature/portofolio_detail/presentation/view/portofolio_view.dart';
import 'package:foto_in/feature/profile/provider/profile_provider.dart';
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
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backgroundPrimary,
          primarySwatch: AppColor.primary,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.backgroundPrimary,
            foregroundColor: AppColor.textPrimary,
            surfaceTintColor: AppColor.backgroundPrimary,
            titleTextStyle: FotoInHeadingTypography.xSmall(
              color: AppColor.textPrimary,
            ),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(AppColor.primary),
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

          // User Order
          OrderUserDetailView.routeName: (context) =>
              const OrderUserDetailView(),
          PreviewView.routeName: (context) => const PreviewView(),
          UploadPreviewView.routeName: (context) => const UploadPreviewView(),
          UploadHasilView.routeName: (context) => const UploadHasilView(),

          // Fotografer Order
          FotograferOrderView.routeName: (context) =>
              const FotograferOrderView(),
          OrderFotofgraferDetailView.routeName: (context) =>
              const OrderFotofgraferDetailView(),

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

          // Portofolio
          PortofolioMobileView.routeName: (context) =>
              const PortofolioMobileView(),
          PortofolioDetailMobileView.routeName: (context) =>
              const PortofolioDetailMobileView(),
        },
        title: 'Flutter Demo',
        home: Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          body: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return const Beranda();
              } else {
                // return const NavigationBarMobile();
                return const AuthView();
              }
            },
          ),
        ),
      ),
    );
  }
}
