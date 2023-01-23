part of 'issue_complaint_page.dart';

abstract class _IssueComplaintPageProps extends State<IssueComplaintPage> {
  final ScrollController _eShowSectionsController = ScrollController();
  List<DropdownMenuItem<ComplaintType>>? _dropdownMenuItemsTags = [];
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String amount = "";
  bool loadingDialogIsOpen = false;
  late FocusNode focusSubject;
  late FocusNode focusMessage;

  List<DropdownMenuItem<ComplaintType>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ComplaintType>> items = [];
    for (ComplaintType listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Text(
              listItem.name ?? "",
              //style: AppTheme.info_general_text,
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  void dispose() {
    _eShowSectionsController.dispose();
    super.dispose();
  }

  void dismissDialog() {
    if (loadingDialogIsOpen) {
      //context.router.pop();
    }

    setState(() {
      loadingDialogIsOpen = false;
    });
  }

  void initDropDown(List<ComplaintType> list) {
    _dropdownMenuItemsTags = buildDropDownMenuItems(list);
  }

  @override
  void initState() {
    addListeners();
    super.initState();
  }

  void addListeners() {
    focusSubject = FocusNode();
    focusMessage = FocusNode();

    _subjectController
        .addListener(() => subjectChanged(_subjectController.text));
    _messageController
        .addListener(() => messageChanged(_messageController.text));
  }

  void subjectChanged(String v) {
    //  context.read<IssueComplaintCubit>().subjectChangedToState(v);
  }

  void messageChanged(String v) {
    // context.read<IssueComplaintCubit>().messageChangedToState(v);
  }
}
