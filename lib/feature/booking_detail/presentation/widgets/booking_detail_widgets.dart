import 'dart:math';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/data/booking/model/BookingRequest.dart';
import 'package:foto_in/feature/booking_detail/presentation/presentation/booking_detail_provider.dart';
import 'package:foto_in/feature/booking_detail/presentation/widgets/portofolio_card.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/payment/presentation/widgets/payment_widgets.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BookingDetailWidget extends StatefulWidget {
  const BookingDetailWidget({super.key});

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  String _selectedDate = '';

  final TextEditingController _selectedController = TextEditingController();
  final TextEditingController _tfEditingJenisAcara = TextEditingController();
  final TextEditingController _tfEditingLokasiAcara = TextEditingController();
  final TextEditingController _tfEditingTanggalAcara = TextEditingController();
  final TextEditingController _tfEditingDurasi = TextEditingController();
  final TextEditingController _tfEditingWaktuMulai = TextEditingController();
  final TextEditingController _tfEditingKonsep = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedController.text = _selectedDate;
    initializeDateFormatting('id_ID', null);
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        final PickerDateRange range = args.value;
        _selectedDate = DateFormat('d MMMM yyyy', 'id_ID')
            .format(range.startDate!)
            .toString();
      } else if (args.value is DateTime) {
        // make if mm 01 change to januari in bahasa
        _selectedDate =
            DateFormat('dd MMMM yyyy', 'id_ID').format(args.value).toString();
      } else if (args.value is List<DateTime>) {
        _selectedDate = '';
        for (int i = 0; i < args.value.length; i++) {
          if (i == 0) {
            _selectedDate = DateFormat('d MMMM yyyy', 'id_ID')
                .format(args.value[i])
                .toString();
          } else {
            _selectedDate +=
                ' - ${DateFormat('d MMMM yyyy', 'id_ID').format(args.value[i])}';
          }
        }
      }
    });
  }

  void _onCancel() {
    setState(() {
      //when cancel date picker close and unselected
      _selectedDate = '';
      Navigator.pop(context);
    });
  }

  void _onSubmit() {
    setState(() {
      //when click submit button
      _selectedController.text = _selectedDate;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const NavigationCustom(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 44,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 32),
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.arrow_left),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Kembali",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textPrimary),
                            ),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColor.primary,
                        child: Icon(
                          Iconsax.calendar,
                          size: 16,
                          color: AppColor.primary,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cahaya Aabadi Photography",
                        style: FotoInHeadingTypography.mega(
                            color: AppColor.textPrimary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  EdgeInsets.only(right: index == 4 ? 0 : 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColor.secondary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "Prewedding",
                                style: FotoInSubHeadingTypography.xSmall(
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ResizeWidgets(
                    width: 1003,
                    sChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IDR Range_1 - Range_2",
                          style: FotoInSubHeadingTypography.xxLarge(
                              color: AppColor.textPrimary),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              IconsaxBold.star,
                              color: Color(0xffF8B300),
                              size: 32,
                            ),
                            Text(
                              "4.5",
                              style: FotoInSubHeadingTypography.xxLarge(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "200+ Project",
                              style: FotoInSubHeadingTypography.xSmall(
                                  color: AppColor.textPrimary),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Canon EOS 5D Mark IV Kit",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Nikon D780",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textSecondary),
                            ),
                          ],
                        )
                      ],
                    ),
                    lChild: Row(
                      children: [
                        Text(
                          "IDR Range_1 - Range_2",
                          style: FotoInSubHeadingTypography.xxLarge(
                              color: AppColor.textPrimary),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Iconsax.star1,
                              color: Color(0xffF8B300),
                              size: 32,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "4.5",
                              style: FotoInSubHeadingTypography.xxLarge(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "200+ Project",
                              style: FotoInSubHeadingTypography.xSmall(
                                  color: AppColor.textPrimary),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Row(
                          children: [
                            Text(
                              "Canon EOS 5D Mark IV Kit",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Nikon D780",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textSecondary),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ResizeWidgets(
                    width: 1574,
                    sChild: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage(
                                  'assets/images/image-carousel-web.png'),
                              alignment: Alignment.center,
                              // height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          right: index == 4 ? 0 : 8),
                                      constraints: const BoxConstraints(
                                        maxHeight: 180,
                                        maxWidth: 200,
                                        minHeight: 0,
                                        minWidth: 0,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/images/image-carousel-web.png'),
                                        alignment: Alignment.center,
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x143C4257),
                                  blurRadius: 35,
                                  offset: Offset(0, 15),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pesanan",
                                  style: FotoInHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Silahkan masukan detil pesanan anda",
                                  style: FotoInParagraph.small(
                                      color: AppColor.textSecondary),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Jenis Acara",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: _tfEditingJenisAcara,
                                    hintText: "Prewedding",
                                    maxLines: 1,
                                    validator: "Jenis Acara",
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Lokasi Acara",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: _tfEditingLokasiAcara,
                                    hintText:
                                        "Gedung Serbaguna Telkom University",
                                    maxLines: 5,
                                    validator: "Tempat Acara",
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Tanggal Acara",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TfFotoin(
                                          controller: _selectedController,
                                          readOnly: true,
                                          maxLines: 1,
                                          validator: "Tanggal",
                                          hintText: "31 Mei 2021",
                                          keyboardType: TextInputType.name),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: SizedBox(
                                                  height: 300,
                                                  width: 300,
                                                  child: SfDateRangePicker(
                                                    showActionButtons: true,
                                                    onSubmit: (Object? value) {
                                                      _onSubmit();
                                                    },
                                                    onCancel: () {
                                                      _onCancel();
                                                    },
                                                    onSelectionChanged:
                                                        _onSelectionChanged,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Pilih Tanggal",
                                          style:
                                              FotoInSubHeadingTypography.xSmall(
                                                  color:
                                                      const Color(0xffffffff)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Durasi",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: _tfEditingDurasi,
                                    hintText: "3 Jam",
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    validator: "Durasi"),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Waktu Mulai",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: _tfEditingWaktuMulai,
                                    hintText: "10:00 WIB",
                                    maxLines: 1,
                                    validator: "Waktu Mulai",
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Catatan/Konsep",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: _tfEditingKonsep,
                                    hintText: "Konsep Prewedding",
                                    validator: "Catatan/Konsep",
                                    maxLines: 5,
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Consumer<BookingDetailProvider>(
                                  builder: (context, state, _) {
                                    return BtnPrimary(
                                        tvButton: "Ajukan Pesanan",
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            try {
                                              state.postBooking(
                                                bookingRequest: BookingRequest(
                                                    photographerId: "1",
                                                    acara: _tfEditingJenisAcara
                                                        .text,
                                                    lokasi:
                                                        _tfEditingLokasiAcara
                                                            .text,
                                                    sesiFoto:
                                                        _tfEditingTanggalAcara
                                                            .text,
                                                    tanggalBooking:
                                                        _selectedDate,
                                                    durasi: int.tryParse(
                                                            _tfEditingDurasi
                                                                .text) ??
                                                        0,
                                                    konsep:
                                                        _tfEditingKonsep.text,
                                                    waktuMulai:
                                                        _tfEditingWaktuMulai
                                                            .text,
                                                    totalHarga: Random()
                                                            .nextInt(500000) +
                                                        400000),
                                              );
                                              DialogItem(
                                                // path: "/pesanan",
                                                onPressed: () {
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          "/pesanan",
                                                          (route) => false);
                                                },
                                              );
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      "Gagal Ajukan Pesanan"),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        radius: 8);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    lChild: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   constraints: BoxConstraints(
                              //     maxHeight:
                              //         MediaQuery.of(context).size.height * 0.5,
                              //     maxWidth:
                              //         MediaQuery.of(context).size.width * 0.5,
                              //     minHeight: 0,
                              //     minWidth: 0,
                              //   ),
                              //   clipBehavior: Clip.antiAlias,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(16),
                              //   ),
                              //   alignment: Alignment.center,
                              //   child: const Image(
                              //     image: AssetImage(
                              //         'assets/images/image-carousel-web.png'),
                              //     alignment: Alignment.center,
                              //     height: double.infinity,
                              //     width: double.infinity,
                              //     fit: BoxFit.fill,
                              //   ),
                              // ),
                              const Image(
                                image: AssetImage(
                                    'assets/images/image-carousel-web.png'),
                                alignment: Alignment.center,
                                // height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 180,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            right: index == 4 ? 0 : 8),
                                        constraints: const BoxConstraints(
                                          maxHeight: 180,
                                          maxWidth: 200,
                                          minHeight: 0,
                                          minWidth: 0,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/image-carousel-web.png'),
                                          alignment: Alignment.center,
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            width: 400,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x143C4257),
                                  blurRadius: 35,
                                  offset: Offset(0, 15),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pesanan",
                                  style: FotoInHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Silahkan masukan detil pesanan anda",
                                  style: FotoInParagraph.small(
                                      color: AppColor.textSecondary),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Jenis Acara",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: TextEditingController(),
                                    hintText: "Prewedding",
                                    maxLines: 1,
                                    validator: "Jenis Acara",
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Lokasi Acara",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: TextEditingController(),
                                    hintText:
                                        "Gedung Serbaguna Telkom University",
                                    maxLines: 5,
                                    validator: "Tempat Acara",
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Tanggal Acara",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TfFotoin(
                                          controller: _selectedController,
                                          readOnly: true,
                                          maxLines: 1,
                                          validator: "Tanggal",
                                          hintText: "31 Mei 2021",
                                          keyboardType: TextInputType.name),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: SizedBox(
                                                  height: 300,
                                                  width: 300,
                                                  child: SfDateRangePicker(
                                                    showActionButtons: true,
                                                    onSubmit: (Object? value) {
                                                      _onSubmit();
                                                    },
                                                    onCancel: () {
                                                      _onCancel();
                                                    },
                                                    onSelectionChanged:
                                                        _onSelectionChanged,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Pilih Tanggal",
                                          style:
                                              FotoInSubHeadingTypography.xSmall(
                                                  color:
                                                      const Color(0xffffffff)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Durasi",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: TextEditingController(),
                                    hintText: "3 Jam",
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    validator: "Durasi"),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Waktu Mulai",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: TextEditingController(),
                                    hintText: "10:00 WIB",
                                    maxLines: 1,
                                    validator: "Waktu Mulai",
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Catatan/Konsep",
                                  style: FotoInSubHeadingTypography.small(
                                      color: AppColor.textPrimary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TfFotoin(
                                    controller: TextEditingController(),
                                    hintText: "Konsep Prewedding",
                                    validator: "Catatan/Konsep",
                                    maxLines: 5,
                                    keyboardType: TextInputType.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                BtnPrimary(
                                    tvButton: "Ajukan Pesanan",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Do something
                                      }
                                    },
                                    radius: 8)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Text(
                    "Pernikahan Romantis di Pantai",
                    style: FotoInHeadingTypography.xLarge(
                        color: AppColor.textPrimary),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Pernikahan pasangan Budi dan Ani yang diadakan di tepi pantai dengan tema romantis dan alami. Foto-foto ini menampilkan momen-momen istimewa sepanjang acara pernikahan mereka. Suasana pantai memberikan sentuhan magis pada pernikahan mereka. Cahaya senja memperindah momen-momen romantis saat Budi dan Ani bertukar sumpah setia di hadapan keluarga dan teman-teman tercinta. Sorotan matahari terbenam menciptakan siluet indah mereka yang saling melengkapi, mengabadikan kebahagiaan yang mengalir begitu alami di antara mereka. Ombak yang menghempas lembut menjadi saksi bisu dari janji abadi yang mereka ucapkan. ",
                    style: FotoInParagraph.large(color: AppColor.textPrimary),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    "Portofolio Lainnya",
                    style: FotoInHeadingTypography.xLarge(
                        color: AppColor.textPrimary),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 440,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const PortofolioDetailCard();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    "Penilaian dan Ulasan",
                    style: FotoInHeadingTypography.xLarge(
                        color: AppColor.textPrimary),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ResizeWidgets(
                    width: 573,
                    sChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Penilaian",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "156",
                              style: FotoInHeadingTypography.xLarge(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text("5 penilaian baru bulan ini",
                                style: FotoInParagraph.medium(
                                    color: AppColor.textSecondary)),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rata-rata Penilaian",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  "4.5",
                                  style: FotoInHeadingTypography.xLarge(
                                      color: AppColor.textPrimary),
                                ),
                                RatingBar.builder(
                                  itemBuilder: (context, _) => const Icon(
                                    Iconsax.star1,
                                    color: Color(0xffFFD11C),
                                  ),
                                  onRatingUpdate: (rating) {},
                                  initialRating: 4.5,
                                  allowHalfRating: true,
                                  itemSize: 32,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.zero,
                                  ignoreGestures: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text("Rata-rata penilaian  Fotografer",
                                style: FotoInParagraph.medium(
                                    color: AppColor.textSecondary)),
                          ],
                        ),
                      ],
                    ),
                    lChild: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Penilaian",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "156",
                              style: FotoInHeadingTypography.xLarge(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text("5 penilaian baru bulan ini",
                                style: FotoInParagraph.medium(
                                    color: AppColor.textSecondary)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rata-rata Penilaian",
                              style: FotoInSubHeadingTypography.large(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  "4.5",
                                  style: FotoInHeadingTypography.xLarge(
                                      color: AppColor.textPrimary),
                                ),
                                RatingBar.builder(
                                  itemBuilder: (context, _) => const Icon(
                                    Iconsax.star1,
                                    color: Color(0xffFFD11C),
                                  ),
                                  onRatingUpdate: (rating) {},
                                  initialRating: 4.5,
                                  allowHalfRating: true,
                                  itemSize: 32,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.zero,
                                  ignoreGestures: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text("Rata-rata penilaian  Fotografer",
                                style: FotoInParagraph.medium(
                                    color: AppColor.textSecondary)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResizeWidgets extends StatelessWidget {
  const ResizeWidgets(
      {super.key,
      required this.width,
      required this.sChild,
      required this.lChild});

  final double width;
  final Widget sChild;
  final Widget lChild;

  @override
  Widget build(BuildContext context) {
    if (width > MediaQuery.of(context).size.width) {
      return sChild;
    } else {
      return lChild;
    }
  }
}
