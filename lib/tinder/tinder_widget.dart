import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'tinder_model.dart';
export 'tinder_model.dart';

class TinderWidget extends StatefulWidget {
  const TinderWidget({super.key});

  @override
  State<TinderWidget> createState() => _TinderWidgetState();
}

class _TinderWidgetState extends State<TinderWidget> {
  late TinderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TinderModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Page Title',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<List<UsersRow>>(
                  future: UsersTable().queryRows(
                    queryFn: (q) => q,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: SpinKitDoubleBounce(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 10.0,
                          ),
                        ),
                      );
                    }
                    List<UsersRow> swipeableStackUsersRowList = snapshot.data!;
                    return FlutterFlowSwipeableStack(
                      onSwipeFn: (index) {},
                      onLeftSwipe: (index) async {
                        final swipeableStackUsersRow =
                            swipeableStackUsersRowList[index];

                        context.pushNamed('tinder');
                      },
                      onRightSwipe: (index) {},
                      onUpSwipe: (index) {},
                      onDownSwipe: (index) {},
                      itemBuilder: (context, swipeableStackIndex) {
                        final swipeableStackUsersRow =
                            swipeableStackUsersRowList[swipeableStackIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              swipeableStackUsersRow.avatar,
                              'https://images.unsplash.com/photo-1610730260505-0b9ed7f06293?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MTExMjE2OTN8MA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      itemCount: swipeableStackUsersRowList.length,
                      controller: _model.swipeableStackController,
                      loop: false,
                      cardDisplayCount: 3,
                      scale: 0.9,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
