import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hp_app/features/hp_characters_list/widgets/hp_characters_status.dart';
import 'package:hp_app/repositories/hp_characters/hp_characters.dart';

class HpCharactersTile extends StatelessWidget {
  const HpCharactersTile({
    super.key,
    required this.characterName,
  });

  final HpCharacters characterName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        color: const Color.fromRGBO(86, 86, 86, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            characterName.image.isNotEmpty ?
            CachedNetworkImage(
              imageUrl: characterName.image,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(color: Colors.grey),
            ) : const Placeholder(child: Icon(Icons.error),),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Text(
                      characterName.name,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HpCharactersStatus(
                      liveState: characterName.alive == true
                          ? LiveState.alive
                          : characterName.alive == false
                              ? LiveState.dead
                              : LiveState.unknown),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Species:',
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              characterName.species,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender:',
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              characterName.gender,
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
            ),
          ],
        ),
        // leading: Image.network(
        //   characterName.image,
        //   height: 50,
        //   width: 50,
        //   errorBuilder: (context, error, stackTrace) {
        //     return const SizedBox(
        //       height: 50,
        //       width: 50,
        //       child: Icon(Icons.error),
        //     );
        //   },
        // ),
        // title: Text(
        //   characterName.name,
        //   style: theme.textTheme.bodyMedium,
        // ),
        // trailing: const Icon(Icons.arrow_forward_ios),
        // onTap: () {
        //   Navigator.of(context).pushNamed(
        //     '/character',
        //     arguments: characterName,
        //   );
        // },
      ),
    );
  }
}
