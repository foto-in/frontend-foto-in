import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/booking_bottom_bar.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingWidgetMobile extends StatefulWidget {
  const BookingWidgetMobile({super.key});

  @override
  State<BookingWidgetMobile> createState() => _BookingWidgetMobileState();
}

class _BookingWidgetMobileState extends State<BookingWidgetMobile> {
  String _selectedDate = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  final TextEditingController _selectedController = TextEditingController();
  final TextEditingController _tfEditingJenisAcara = TextEditingController();
  final TextEditingController _tfEditingLokasiAcara = TextEditingController();
  final TextEditingController _tfEditingTanggalAcara = TextEditingController();
  final TextEditingController _tfEditingDurasi = TextEditingController();
  final TextEditingController _tfEditingWaktuMulai = TextEditingController();
  final TextEditingController _tfEditingKonsep = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPrimary,
        titleTextStyle: FotoInHeadingTypography.small(
          color: AppColor.textPrimary,
        ),
        centerTitle: true,
        title: Text('Booking'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Form(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
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
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext builder) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.7,
                                    child: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                          decoration: const BoxDecoration(
                                            color: AppColor.backgroundPrimary,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _onCancel();
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: AppColor.textPrimary,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                "Atur Tanggal Acara",
                                                style: FotoInHeadingTypography
                                                    .xSmall(
                                                        color: AppColor
                                                            .textPrimary),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              SfDateRangePicker(
                                                yearCellStyle:
                                                    DateRangePickerYearCellStyle(
                                                  textStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textPrimary),
                                                  todayTextStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textPrimary),
                                                  leadingDatesTextStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textSecondary),
                                                  disabledDatesTextStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textSecondary),
                                                ),
                                                monthCellStyle:
                                                    DateRangePickerMonthCellStyle(
                                                  disabledDatesTextStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textSecondary),
                                                  todayTextStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textPrimary),
                                                  textStyle:
                                                      FotoInSubHeadingTypography
                                                          .xSmall(
                                                              color: AppColor
                                                                  .textPrimary),
                                                ),
                                                backgroundColor:
                                                    AppColor.backgroundPrimary,
                                                view: DateRangePickerView.month,
                                                selectionColor:
                                                    AppColor.primary,
                                                selectionMode:
                                                    DateRangePickerSelectionMode
                                                        .single,
                                                headerStyle: DateRangePickerHeaderStyle(
                                                    textAlign: TextAlign.left,
                                                    backgroundColor: AppColor
                                                        .backgroundPrimary,
                                                    textStyle:
                                                        FotoInSubHeadingTypography
                                                            .small(
                                                                color: AppColor
                                                                    .textPrimary)),
                                                // showActionButtons: true,
                                                showNavigationArrow: true,
                                                todayHighlightColor:
                                                    AppColor.primary,
                                                confirmText: "Pilih",
                                                cancelText: "Batal",
                                                monthViewSettings:
                                                    DateRangePickerMonthViewSettings(
                                                  showTrailingAndLeadingDates:
                                                      true,
                                                  viewHeaderStyle:
                                                      DateRangePickerViewHeaderStyle(
                                                    textStyle:
                                                        FotoInSubHeadingTypography
                                                            .small(
                                                                color: AppColor
                                                                    .textPrimary),
                                                  ),
                                                  dayFormat: 'EEE',
                                                  weekNumberStyle:
                                                      DateRangePickerWeekNumberStyle(
                                                          textStyle: FotoInSubHeadingTypography
                                                              .xSmall(
                                                                  color: AppColor
                                                                      .textPrimary)),
                                                ),
                                                selectionTextStyle:
                                                    FotoInParagraph.small(
                                                        color: AppColor
                                                            .backgroundPrimary),

                                                onSelectionChanged:
                                                    (DateRangePickerSelectionChangedArgs
                                                        args) {
                                                  _onSelectionChanged(args);
                                                  setState(() {});
                                                },
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                "Tanggal acara ",
                                                style:
                                                    FotoInSubHeadingTypography
                                                        .small(
                                                            color: AppColor
                                                                .textSecondary),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                _selectedDate,
                                                style: FotoInHeadingTypography
                                                    .xSmall(
                                                        color: AppColor
                                                            .textPrimary),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              FotoInButton(
                                                  text: "Simpan",
                                                  onPressed: () {
                                                    _onSubmit();
                                                  })
                                            ],
                                          ));
                                    }),
                                  );
                                });
                          },
                          child: Text(
                            "Pilih Tanggal",
                            style: FotoInSubHeadingTypography.xSmall(
                                color: const Color(0xffffffff)),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      prefixIcon: const Icon(
                        Iconsax.location5,
                        color: Color(0xff788B98),
                      ),
                      controller: _tfEditingLokasiAcara,
                      hintText: "Gedung Serbaguna Telkom University",
                      maxLines: 1,
                      validator: "Tempat Acara",
                      keyboardType: TextInputType.name),
                ],
              ),
            )),
            BookingBottomBar()
          ],
        ),
      ),
    );
  }
}
