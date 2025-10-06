import 'package:hive/hive.dart';
import 'package:portable_radio/domain/model/radio_station.dart';

class RadioStationAdapter extends TypeAdapter<RadioStation> {
  @override
  final int typeId = 0;

  @override
  RadioStation read(BinaryReader reader) {
    final name = reader.readString();
    final uri = Uri.parse(reader.readString());
    final iconUri = Uri.parse(reader.readString());
    return RadioStation(name: name, uri: uri, iconUri: iconUri);
  }

  @override
  void write(BinaryWriter writer, RadioStation obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.uri.toString());
    writer.writeString(obj.iconUri.toString());
  }
}
