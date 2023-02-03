import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/utils/widgets/basic_scaffold_view.dart';
import 'package:tekction/utils/widgets/dropdown_border_input.dart';
import 'package:tekction/utils/widgets/molecules/custom_auto_back.dart';
import 'package:tekction/utils/widgets/regular_input_border.dart';

import '../../../data/model/mode.dart';

part 'issue_complaint_page_props.dart';
part 'issue_complaint_page_widget.dart';

class IssueComplaintPage extends StatefulWidget {
  const IssueComplaintPage({Key? key, required this.orderHistory})
      : super(key: key);
  final OrderDetails orderHistory;

  @override
  State<IssueComplaintPage> createState() => _IssueComplaintPageState();
}

class _IssueComplaintPageState extends _IssueComplaintPageProps
    with _IssueComplaintPageWidgets {
  ComplaintType? _value;
  final List<ComplaintType> _complaint = [
    ComplaintType(id: '123', name: 'Name1', status: 1, createdAt: "date1"),
    ComplaintType(id: '123', name: 'Name2', status: 2, createdAt: "date1"),
    ComplaintType(id: '123', name: 'Name3', status: 3, createdAt: "date1"),
    ComplaintType(id: '123', name: 'name4', status: 4, createdAt: "date1")
  ];
  @override
  void initState() {
    // TODO: implement initState
    initDropDown(_complaint);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: AppBar(
            elevation: 0,
            leading: const AutoBackCustom(),
            title: Text('Issue Complaint & Feedback',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24)),
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: BasicScaffoldView(
        bodyWidget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 38, top: 35),
                child: Text(
                  'Type',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: ColorManager.titleColor),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 37, top: 11, right: 38),
                  child: DropdownBorderInput(
                    value: type,
                    onChange: (value) {
                      setFeedback(isFeedback: value == "Feedback");
                    },
                    customItems: ["Feedback", "Complaint"]
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                child: Text(
                                  e,
                                  //style: AppTheme.info_general_text,
                                ),
                              ),
                            ))
                        .toList(),
                    hint: 'Select type',
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 38, top: 35),
                child: Text(
                  '$type type',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: ColorManager.titleColor),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 37, top: 11, right: 38),
                  child: DropdownBorderInput(
                    value: _value,
                    onChange: (value) {
                      // context.read<IssueComplaintCubit>().selectItem(value);
                    },
                    customItems: _dropdownMenuItemsTags!,
                    hint: 'Select subject',
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 38, top: 35),
                child: Text(
                  'Subject',
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: ColorManager.titleColor),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 37, top: 11, right: 38),
                  child: RegularInputBorder(
                    contentPadding: true,
                    hintText: 'Type in the ${type.toLowerCase()} subject',
                    controller: _subjectController,
                    inputType: TextInputType.text,
                    /* errorText:
                        state.subject.invalid ? S.current.required_input : null, */
                    focusNode: focusSubject,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 38, top: 35),
                child: Text(
                  type,
                  style: ThemeData().textTheme.headline1?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: ColorManager.titleColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 37, top: 11, right: 38),
                child: RegularInputBorder(
                  contentPadding: true,
                  hintText: 'Type in your ${type.toLowerCase()}',
                  maxLine: 8,
                  minLine: 8,
                  controller: _messageController,
                  inputType: TextInputType.text,
                  /*  errorText:
                      state.message.invalid ? S.current.required_input : null, */
                  focusNode: focusMessage,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 186, left: 120, right: 120),
                child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          const Set<MaterialState> interactiveStates =
                              <MaterialState>{
                            MaterialState.disabled,
                          };
                          if (states.any(interactiveStates.contains)) {
                            return ColorManager.disableBtn;
                          }
                          return ColorManager.activeIcon;
                        }),
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry>((Set<MaterialState> states) {
                          return const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 32,
                          );
                        }),
                      ),
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                'Save',
                                style:
                                    ThemeData().textTheme.headline1?.copyWith(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed:
                          () {} /* state.formStatus.isValidated &&
                              state.complaintType != null &&
                              !state.formStatus.isSubmissionInProgress
                          ? () {
                              context
                                  .read<IssueComplaintCubit>()
                                  .sendComplaintIssue(widget.orderHistory.id!);
                            }
                          : null */
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
