DST_ANDROID_PATH="./android/src/main/java/com/fluttercandies/amap/pigeon"
if([ ! -d $DST_ANDROID_PATH ]); then
    mkdir -p $DST_ANDROID_PATH
fi

DST_DART_PATH="lib/src"
if([ ! -d $DST_DART_PATH ]); then
    mkdir -p $DST_DART_PATH
fi

flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out "$DST_DART_PATH/pigeon.dart" \
  --objc_header_out ios/Classes/pigeon.h \
  --objc_source_out ios/Classes/pigeon.m \
  --java_out "$DST_ANDROID_PATH/Pigeon.java" \
  --java_package "com.fluttercandies.amap.pigeon"