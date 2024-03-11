import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ratingbar_model.dart';
export 'ratingbar_model.dart';

class RatingbarWidget extends StatefulWidget {
  const RatingbarWidget({
    super.key,
    this.ratingbar,
    this.usergameid,
    this.userid,
  });

  final int? ratingbar;
  final String? usergameid;
  final String? userid;

  @override
  State<RatingbarWidget> createState() => _RatingbarWidgetState();
}

class _RatingbarWidgetState extends State<RatingbarWidget> {
  late RatingbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await ResourseTable().update(
          data: {
            'ratingbar': widget.ratingbar,
          },
          matchingRows: (rows) => rows
              .eq(
                'user_id',
                currentUserUid,
              )
              .eq(
                'usergameid',
                widget.usergameid,
              ),
        );
      },
      child: RatingBarIndicator(
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).tertiary,
        ),
        direction: Axis.horizontal,
        rating: widget.ratingbar!.toDouble(),
        unratedColor: FlutterFlowTheme.of(context).alternate,
        itemCount: 5,
        itemSize: 15.0,
      ),
    );
  }
}
