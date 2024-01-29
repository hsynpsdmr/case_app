import 'package:case_app/constant/constant.dart';
import 'package:case_app/pages/participants/participants_controller.dart';
import 'package:case_app/widget/loading_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final participantsController = ChangeNotifierProvider((ref) => ParticipantsController());

class ParticipantsView extends ConsumerStatefulWidget {
  const ParticipantsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParticipantsViewState();
}

class _ParticipantsViewState extends ConsumerState<ParticipantsView> {
  @override
  void initState() {
    ref.read(participantsController).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(participantsController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Text(
            Constant.participants,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: LoadingScope(
        isLoading: watch.isLoading,
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: watch.users.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.blueGrey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(watch.users[index]!.avatar),
                      radius: 30,
                    ),
                    title: Text('${watch.users[index]!.firstName} ${watch.users[index]!.lastName}'),
                    subtitle: Text(watch.users[index]!.email),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
