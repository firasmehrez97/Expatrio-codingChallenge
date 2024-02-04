// Mocks generated by Mockito 5.4.4 from annotations
// in coding_challenge/test/mocks/mock_classes.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i11;
import 'dart:ui' as _i14;

import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/scheduler.dart' as _i7;
import 'package:flutter/src/material/banner.dart' as _i13;
import 'package:flutter/src/material/scaffold.dart' as _i4;
import 'package:flutter/src/material/snack_bar.dart' as _i12;
import 'package:flutter/widgets.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_1 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOSOptions_2 extends _i1.SmartFake implements _i3.IOSOptions {
  _FakeIOSOptions_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAndroidOptions_3 extends _i1.SmartFake
    implements _i3.AndroidOptions {
  _FakeAndroidOptions_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLinuxOptions_4 extends _i1.SmartFake implements _i3.LinuxOptions {
  _FakeLinuxOptions_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWindowsOptions_5 extends _i1.SmartFake
    implements _i3.WindowsOptions {
  _FakeWindowsOptions_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebOptions_6 extends _i1.SmartFake implements _i3.WebOptions {
  _FakeWebOptions_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMacOsOptions_7 extends _i1.SmartFake implements _i3.MacOsOptions {
  _FakeMacOsOptions_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScaffoldMessenger_8 extends _i1.SmartFake
    implements _i4.ScaffoldMessenger {
  _FakeScaffoldMessenger_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeBuildContext_9 extends _i1.SmartFake implements _i6.BuildContext {
  _FakeBuildContext_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScaffoldFeatureController_10<T extends _i6.Widget, U>
    extends _i1.SmartFake implements _i4.ScaffoldFeatureController<T, U> {
  _FakeScaffoldFeatureController_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_11 extends _i1.SmartFake implements _i6.Widget {
  _FakeWidget_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_12 extends _i1.SmartFake
    implements _i5.DiagnosticsNode {
  _FakeDiagnosticsNode_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i5.TextTreeConfiguration? parentConfiguration,
    _i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info,
  }) =>
      super.toString();
}

class _FakeTicker_13 extends _i1.SmartFake implements _i7.Ticker {
  _FakeTicker_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({bool? debugIncludeStack = false}) => super.toString();
}

class _FakeInheritedWidget_14 extends _i1.SmartFake
    implements _i6.InheritedWidget {
  _FakeInheritedWidget_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<_i2.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i2.Response>);

  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i11.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i11.Uint8List>.value(_i11.Uint8List(0)),
      ) as _i8.Future<_i11.Uint8List>);

  @override
  _i8.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i2.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterSecureStorage extends _i1.Mock
    implements _i3.FlutterSecureStorage {
  MockFlutterSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.IOSOptions get iOptions => (super.noSuchMethod(
        Invocation.getter(#iOptions),
        returnValue: _FakeIOSOptions_2(
          this,
          Invocation.getter(#iOptions),
        ),
      ) as _i3.IOSOptions);

  @override
  _i3.AndroidOptions get aOptions => (super.noSuchMethod(
        Invocation.getter(#aOptions),
        returnValue: _FakeAndroidOptions_3(
          this,
          Invocation.getter(#aOptions),
        ),
      ) as _i3.AndroidOptions);

  @override
  _i3.LinuxOptions get lOptions => (super.noSuchMethod(
        Invocation.getter(#lOptions),
        returnValue: _FakeLinuxOptions_4(
          this,
          Invocation.getter(#lOptions),
        ),
      ) as _i3.LinuxOptions);

  @override
  _i3.WindowsOptions get wOptions => (super.noSuchMethod(
        Invocation.getter(#wOptions),
        returnValue: _FakeWindowsOptions_5(
          this,
          Invocation.getter(#wOptions),
        ),
      ) as _i3.WindowsOptions);

  @override
  _i3.WebOptions get webOptions => (super.noSuchMethod(
        Invocation.getter(#webOptions),
        returnValue: _FakeWebOptions_6(
          this,
          Invocation.getter(#webOptions),
        ),
      ) as _i3.WebOptions);

  @override
  _i3.MacOsOptions get mOptions => (super.noSuchMethod(
        Invocation.getter(#mOptions),
        returnValue: _FakeMacOsOptions_7(
          this,
          Invocation.getter(#mOptions),
        ),
      ) as _i3.MacOsOptions);

  @override
  _i8.Future<void> write({
    required String? key,
    required String? value,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [],
          {
            #key: key,
            #value: value,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<String?> read({
    required String? key,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);

  @override
  _i8.Future<bool> containsKey({
    required String? key,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<void> delete({
    required String? key,
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<Map<String, String>> readAll({
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i8.Future<Map<String, String>>);

  @override
  _i8.Future<void> deleteAll({
    _i3.IOSOptions? iOptions,
    _i3.AndroidOptions? aOptions,
    _i3.LinuxOptions? lOptions,
    _i3.WebOptions? webOptions,
    _i3.MacOsOptions? mOptions,
    _i3.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [ScaffoldMessengerState].
///
/// See the documentation for Mockito's code generation for more information.
class MockScaffoldMessengerState extends _i1.Mock
    implements _i4.ScaffoldMessengerState {
  MockScaffoldMessengerState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.ScaffoldMessenger get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeScaffoldMessenger_8(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i4.ScaffoldMessenger);

  @override
  _i6.BuildContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeBuildContext_9(
          this,
          Invocation.getter(#context),
        ),
      ) as _i6.BuildContext);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  void didChangeDependencies() => super.noSuchMethod(
        Invocation.method(
          #didChangeDependencies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.ScaffoldFeatureController<_i12.SnackBar, _i12.SnackBarClosedReason>
      showSnackBar(_i12.SnackBar? snackBar) => (super.noSuchMethod(
            Invocation.method(
              #showSnackBar,
              [snackBar],
            ),
            returnValue: _FakeScaffoldFeatureController_10<_i12.SnackBar,
                _i12.SnackBarClosedReason>(
              this,
              Invocation.method(
                #showSnackBar,
                [snackBar],
              ),
            ),
          ) as _i4.ScaffoldFeatureController<_i12.SnackBar,
              _i12.SnackBarClosedReason>);

  @override
  void removeCurrentSnackBar(
          {_i12.SnackBarClosedReason? reason =
              _i12.SnackBarClosedReason.remove}) =>
      super.noSuchMethod(
        Invocation.method(
          #removeCurrentSnackBar,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void hideCurrentSnackBar(
          {_i12.SnackBarClosedReason? reason =
              _i12.SnackBarClosedReason.hide}) =>
      super.noSuchMethod(
        Invocation.method(
          #hideCurrentSnackBar,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearSnackBars() => super.noSuchMethod(
        Invocation.method(
          #clearSnackBars,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.ScaffoldFeatureController<_i13.MaterialBanner,
      _i13.MaterialBannerClosedReason> showMaterialBanner(
          _i13.MaterialBanner? materialBanner) =>
      (super.noSuchMethod(
        Invocation.method(
          #showMaterialBanner,
          [materialBanner],
        ),
        returnValue: _FakeScaffoldFeatureController_10<_i13.MaterialBanner,
            _i13.MaterialBannerClosedReason>(
          this,
          Invocation.method(
            #showMaterialBanner,
            [materialBanner],
          ),
        ),
      ) as _i4.ScaffoldFeatureController<_i13.MaterialBanner,
          _i13.MaterialBannerClosedReason>);

  @override
  void removeCurrentMaterialBanner(
          {_i13.MaterialBannerClosedReason? reason =
              _i13.MaterialBannerClosedReason.remove}) =>
      super.noSuchMethod(
        Invocation.method(
          #removeCurrentMaterialBanner,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void hideCurrentMaterialBanner(
          {_i13.MaterialBannerClosedReason? reason =
              _i13.MaterialBannerClosedReason.hide}) =>
      super.noSuchMethod(
        Invocation.method(
          #hideCurrentMaterialBanner,
          [],
          {#reason: reason},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clearMaterialBanners() => super.noSuchMethod(
        Invocation.method(
          #clearMaterialBanners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Widget build(_i6.BuildContext? context) => (super.noSuchMethod(
        Invocation.method(
          #build,
          [context],
        ),
        returnValue: _FakeWidget_11(
          this,
          Invocation.method(
            #build,
            [context],
          ),
        ),
      ) as _i6.Widget);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void initState() => super.noSuchMethod(
        Invocation.method(
          #initState,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateWidget(_i4.ScaffoldMessenger? oldWidget) => super.noSuchMethod(
        Invocation.method(
          #didUpdateWidget,
          [oldWidget],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reassemble() => super.noSuchMethod(
        Invocation.method(
          #reassemble,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setState(_i14.VoidCallback? fn) => super.noSuchMethod(
        Invocation.method(
          #setState,
          [fn],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deactivate() => super.noSuchMethod(
        Invocation.method(
          #deactivate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void activate() => super.noSuchMethod(
        Invocation.method(
          #activate,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void debugFillProperties(_i5.DiagnosticPropertiesBuilder? properties) =>
      super.noSuchMethod(
        Invocation.method(
          #debugFillProperties,
          [properties],
        ),
        returnValueForMissingStub: null,
      );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();

  @override
  String toStringShort() => (super.noSuchMethod(
        Invocation.method(
          #toStringShort,
          [],
        ),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.method(
            #toStringShort,
            [],
          ),
        ),
      ) as String);

  @override
  _i5.DiagnosticsNode toDiagnosticsNode({
    String? name,
    _i5.DiagnosticsTreeStyle? style,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toDiagnosticsNode,
          [],
          {
            #name: name,
            #style: style,
          },
        ),
        returnValue: _FakeDiagnosticsNode_12(
          this,
          Invocation.method(
            #toDiagnosticsNode,
            [],
            {
              #name: name,
              #style: style,
            },
          ),
        ),
      ) as _i5.DiagnosticsNode);

  @override
  _i7.Ticker createTicker(_i7.TickerCallback? onTick) => (super.noSuchMethod(
        Invocation.method(
          #createTicker,
          [onTick],
        ),
        returnValue: _FakeTicker_13(
          this,
          Invocation.method(
            #createTicker,
            [onTick],
          ),
        ),
      ) as _i7.Ticker);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i6.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Widget get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeWidget_11(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i6.Widget);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  bool get debugDoingBuild => (super.noSuchMethod(
        Invocation.getter(#debugDoingBuild),
        returnValue: false,
      ) as bool);

  @override
  _i6.InheritedWidget dependOnInheritedElement(
    _i6.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #dependOnInheritedElement,
          [ancestor],
          {#aspect: aspect},
        ),
        returnValue: _FakeInheritedWidget_14(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
      ) as _i6.InheritedWidget);

  @override
  void visitAncestorElements(_i6.ConditionalElementVisitor? visitor) =>
      super.noSuchMethod(
        Invocation.method(
          #visitAncestorElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void visitChildElements(_i6.ElementVisitor? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispatchNotification(_i6.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(
          #dispatchNotification,
          [notification],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.DiagnosticsNode describeElement(
    String? name, {
    _i5.DiagnosticsTreeStyle? style = _i5.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeElement,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_12(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
      ) as _i5.DiagnosticsNode);

  @override
  _i5.DiagnosticsNode describeWidget(
    String? name, {
    _i5.DiagnosticsTreeStyle? style = _i5.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeWidget,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_12(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
      ) as _i5.DiagnosticsNode);

  @override
  List<_i5.DiagnosticsNode> describeMissingAncestor(
          {required Type? expectedAncestorType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeMissingAncestor,
          [],
          {#expectedAncestorType: expectedAncestorType},
        ),
        returnValue: <_i5.DiagnosticsNode>[],
      ) as List<_i5.DiagnosticsNode>);

  @override
  _i5.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeOwnershipChain,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_12(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
      ) as _i5.DiagnosticsNode);
}