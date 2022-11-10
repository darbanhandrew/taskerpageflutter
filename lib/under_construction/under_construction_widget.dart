import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderConstructionWidget extends StatefulWidget {
  const UnderConstructionWidget({Key? key}) : super(key: key);

  @override
  _UnderConstructionWidgetState createState() =>
      _UnderConstructionWidgetState();
}

class _UnderConstructionWidgetState extends State<UnderConstructionWidget> {
  TextEditingController? pinCodeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('UNDER_CONSTRUCTION_underConstruction_ON_');
      if (pinCodeController!.text == '8994') {
        logFirebaseEvent('underConstruction_navigate_to');

        context.pushNamed('Login');

        return;
      } else {
        return;
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'underConstruction'});
    pinCodeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'underConstruction',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'cykxed8e' /* Verify Code to See App */,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primaryColor,
                        obscureText: false,
                        hintCharacter: '●',
                        pinTheme: PinTheme(
                          fieldHeight: 60,
                          fieldWidth: 60,
                          borderWidth: 2,
                          borderRadius: BorderRadius.circular(12),
                          shape: PinCodeFieldShape.box,
                          activeColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          inactiveColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          activeFillColor:
                              FlutterFlowTheme.of(context).secondaryColor,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        controller: pinCodeController,
                        onChanged: (_) => {},
                        onCompleted: (_) async {
                          logFirebaseEvent(
                              'UNDER_CONSTRUCTION_PinCode_00snu6z5_ON_P');
                          if (pinCodeController!.text == '8994') {
                            logFirebaseEvent('PinCode_navigate_to');

                            context.pushNamed('Login');

                            return;
                          } else {
                            return;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
