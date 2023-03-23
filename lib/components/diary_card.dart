import 'package:driftbottlediary/models/diary_model.dart';
import 'package:driftbottlediary/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({super.key, required this.diary, this.onTap});

  final Diary diary;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry? borderRadius = BorderRadius.circular(20.0);
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: theme.cardColor,
      elevation: 1,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: FittedBox(
                    child: FaIcon(
                      diary.feelingLevel.getMoodIcon(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        diary.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${getTimeAgoString(diary.date)}',
                      style: textTheme.labelMedium,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
