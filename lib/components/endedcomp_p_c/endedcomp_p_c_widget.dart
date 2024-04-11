import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'endedcomp_p_c_model.dart';
export 'endedcomp_p_c_model.dart';

class EndedcompPCWidget extends StatefulWidget {
  const EndedcompPCWidget({
    super.key,
    this.title,
    String? titledescription,
    required this.endTime,
    String? price,
    this.competitionid,
    this.imagepath,
  })  : titledescription = titledescription ?? 'Description',
        price = price ?? 'price';

  final String? title;
  final String titledescription;
  final DateTime? endTime;
  final String price;
  final int? competitionid;
  final String? imagepath;

  @override
  State<EndedcompPCWidget> createState() => _EndedcompPCWidgetState();
}

class _EndedcompPCWidgetState extends State<EndedcompPCWidget> {
  late EndedcompPCModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EndedcompPCModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 317.0,
        height: 289.0,
        constraints: const BoxConstraints(
          minWidth: 300.0,
          minHeight: 300.0,
          maxWidth: 800.0,
          maxHeight: 800.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).info,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).info,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 293.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).info,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).info,
                ),
              ),
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  'Title',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Roboto Slab',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Container(
              width: 293.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).info,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).info,
                ),
              ),
              child: Text(
                FFLocalizations.of(context).getText(
                  'iszriltc' /* enddate */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Roboto Slab',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Divider(
              thickness: 1.5,
              indent: 10.0,
              endIndent: 10.0,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: 293.0,
                height: 25.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).info,
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2ikmv0u8' /* Ended */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    child: Image.network(
                      widget.imagepath!,
                      width: 293.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 293.0,
                        height: 40.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'n65n906f' /* Winner: */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto Slab',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      widget.price,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Roboto Slab',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
