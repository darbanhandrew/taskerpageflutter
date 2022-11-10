import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteusersWidget extends StatefulWidget {
  const InviteusersWidget({Key? key}) : super(key: key);

  @override
  _InviteusersWidgetState createState() => _InviteusersWidgetState();
}

class _InviteusersWidgetState extends State<InviteusersWidget> {
  ChatsRecord? createdChat;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Inviteusers'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Inviteusers',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('INVITEUSERS_arrow_back_rounded_ICN_ON_TA');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'uaabnkjm' /* Choose to chat */,
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> columnUsersRecordList = snapshot.data!
                      .where((u) => u.uid != currentUserUid)
                      .toList();
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(columnUsersRecordList.length,
                          (columnIndex) {
                        final columnUsersRecord =
                            columnUsersRecordList[columnIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectionArea(
                                      child: Text(
                                    columnUsersRecord.displayName!
                                        .maybeHandleOverflow(
                                      maxChars: 10,
                                      replacement: '…',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  )),
                                  SelectionArea(
                                      child: Text(
                                    columnUsersRecord.role!.maybeHandleOverflow(
                                      maxChars: 10,
                                      replacement: '…',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  )),
                                ],
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'INVITEUSERS_PAGE_START_CHAT_BTN_ON_TAP');
                                  logFirebaseEvent('Button_backend_call');

                                  final chatsCreateData = {
                                    ...createChatsRecordData(
                                      userA: currentUserReference,
                                      userB: columnUsersRecord.reference,
                                      lastMessage: 'Hello',
                                      lastMessageTime: getCurrentTimestamp,
                                      lastMessageSentBy: currentUserReference,
                                    ),
                                    'users': [columnUsersRecord.reference],
                                    'last_message_seen_by': [
                                      currentUserReference
                                    ],
                                  };
                                  var chatsRecordReference =
                                      ChatsRecord.collection.doc();
                                  await chatsRecordReference
                                      .set(chatsCreateData);
                                  createdChat = ChatsRecord.getDocumentFromData(
                                      chatsCreateData, chatsRecordReference);
                                  logFirebaseEvent('Button_backend_call');

                                  final chatsUpdateData = {
                                    'users': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  };
                                  await createdChat!.reference
                                      .update(chatsUpdateData);
                                  logFirebaseEvent('Button_navigate_to');
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    'PosterChat',
                                    queryParams: {
                                      'chatUser': serializeParam(
                                        columnUsersRecord,
                                        ParamType.Document,
                                      ),
                                      'chatRef': serializeParam(
                                        createdChat!.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatUser': columnUsersRecord,
                                    },
                                  );

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'ytpoioe5' /* Start Chat */,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
