import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hp_app/features/hp_characters_list/widgets/hp_characters_status.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

class HpCharactersTile extends StatefulWidget {
  const HpCharactersTile({
    super.key,
    required this.characterName,
  });

  final HpCharacters characterName;

  @override
  State<HpCharactersTile> createState() => _HpCharactersTileState();
}

class _HpCharactersTileState extends State<HpCharactersTile> {
  double _height = 120;

  void _toggleSize() {
    setState(() {
      _height = _height == 120 ? 300.0 : 120;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _toggleSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          height: _height,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          color: const Color.fromRGBO(86, 86, 86, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.characterName.image.isNotEmpty
                  ? CachedNetworkImage(
                      height: 120,
                      imageUrl: widget.characterName.image,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(color: Colors.grey),
                    )
                  : Image.asset(
                      'assets/png/hp_app.png',
                      color: Colors.white,
                    ),
              Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          widget.characterName.name,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HpCharactersStatus(
                          liveState: widget.characterName.alive == true
                              ? LiveState.alive
                              : widget.characterName.alive == false
                                  ? LiveState.dead
                                  : LiveState.unknown),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Species:',
                                  style: theme.textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.characterName.species,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender:',
                                  style: theme.textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.characterName.gender,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wand:',
                                  style: theme.textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.characterName.wand.values.first,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'House:',
                                  style: theme.textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.characterName.house,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
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
            ],
          ),
        ),
      ),
    );
  }
}
