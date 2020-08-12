import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {

  Widget _buildBodyBackgroud() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBodyBackgroud(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder(
              future: Firestore.instance.collection("home").orderBy("position").getDocuments(),
              builder: (context, snapshot) {
                if(!snapshot.hasData)
                  // when inside a CustomScrollView we must use only Sliver Widgets
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );

                else {
                  // mounts our home page images grid, is an awesome Widget!
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    staggeredTiles: List<StaggeredTile>.from(snapshot.data.documents.map(
                      (doc) {
                        return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                      }
                    ).toList()),
                    children: List<Widget>.from(snapshot.data.documents.map(
                      (doc) { 
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage, 
                          image: doc.data["image"],
                          fit: BoxFit.cover,
                        );
                      }
                    ).toList()),
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }
}