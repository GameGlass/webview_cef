import 'package:webview_cef/src/webview.dart';

typedef TitleChangeCb = void Function(String title);
typedef UrlChangeCb = void Function(String url);
/* Log severity levels. from CEF include/internal/cef_types.h
  0:default logging (currently info logging)
  1:verbose logging or debug logging
  2:info logging
  3:warning logging
  4:error logging
  5:fatal logging
  99:disable logging to file for all messages, and to stderr for messages with severity less than fatal
 */
typedef LoadStartCb = void Function(WebViewController controller, String url);
typedef LoadStopCb = void Function(WebViewController controller, String url);

typedef OnConsoleMessage = void Function(
    int level, String message, String source, int line);

/// A load failed. [errorCode] is a `cef_errorcode_t`; [isMainFrame] separates a
/// failure that blanks the view from a dead sub-resource, which callers usually
/// want to ignore.
///
/// `ERR_ABORTED` is never reported: it is what every in-page navigation looks
/// like natively, and treating it as a failure sends callers into a reload loop.
typedef OnLoadErrorCb = void Function(
    int errorCode, String errorText, String failedUrl, bool isMainFrame);

/// The render process died. [status] is a `cef_termination_status_t`.
///
/// No further frames will be painted, so the texture is now a frozen last frame
/// — reload to get a live surface back.
typedef OnRenderProcessTerminatedCb = void Function(
    int status, int errorCode, String errorString);

class WebviewEventsListener {
  TitleChangeCb? onTitleChanged;
  UrlChangeCb? onUrlChanged;
  OnConsoleMessage? onConsoleMessage;
  LoadStartCb? onLoadStart;
  LoadStopCb? onLoadEnd;
  OnLoadErrorCb? onLoadError;
  OnRenderProcessTerminatedCb? onRenderProcessTerminated;

  WebviewEventsListener({
    this.onTitleChanged,
    this.onUrlChanged,
    this.onConsoleMessage,
    this.onLoadStart,
    this.onLoadEnd,
    this.onLoadError,
    this.onRenderProcessTerminated,
  });
}
