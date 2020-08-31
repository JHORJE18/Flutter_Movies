import 'package:flutter/material.dart';
import 'package:movies/src/models/actor_mode.dart';

class ActorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ActorDetail actor = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.account_circle),
            SizedBox(
              width: 10.0,
            ),
            Text(actor.name)
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/image',
                        arguments: actor.getPicture());
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: FadeInImage(
                        image: NetworkImage(actor.getPicture()),
                        placeholder: AssetImage('assets/loading-infinite.gif'),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      actor.name,
                      style: Theme.of(context).textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(actor.placeOfBirth),
                  ],
                )
              ],
            ),
            Divider(),
            _infoDetail(context, actor),
            Divider(),
            Text(
              actor.biography,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoDetail(BuildContext context, ActorDetail actor) {
    return Column(
      children: [
        _showDetail(context, Icon(Icons.people_outline),
            actor.popularity.toString(), 'Popularidad'),
        _showDetail(
            context, Icon(Icons.date_range), actor.birthday, 'Nacimiento'),
      ],
    );
  }

  Widget _showDetail(
      BuildContext context, Icon icon, String value, String param) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5.0,
          ),
          Text(
            '$value',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
