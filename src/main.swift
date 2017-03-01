import AppKit

typealias Options = ArraySlice<String>

func isInList(values: Options, app: NSRunningApplication) -> Bool {
  return (app.localizedName != nil && values.contains(app.localizedName!)) ||
    (app.bundleIdentifier != nil && values.contains(app.bundleIdentifier!)) ||
    (app.bundleURL != nil && values.contains(app.bundleURL!.path))
}

func maybeKill(values: Options, app: NSRunningApplication) -> Void {
  if isInList(values: values, app: app) {
    print("✋  nope 🚫  :: \(app.localizedName!) :: \(app.bundleIdentifier!)")
    app.forceTerminate()
  }
}

func maybeKillExisting(values: Options) -> Void {
  let apps: [NSRunningApplication] = NSWorkspace.shared().runningApplications
  for app in apps {
    maybeKill(values: values, app: app)
  }
}

func createHandler(values: Options) -> ((_: Notification) -> Void) {
  func handleNotification(notification: Notification) -> Void {
    if let info = notification.userInfo,
      let app = info[NSWorkspaceApplicationKey] as? NSRunningApplication {
      maybeKill(values: values, app: app)
    }
  }
  return handleNotification
}

func addObserver(values: Options) -> Void {
  NSWorkspace.shared()
    .notificationCenter
    .addObserver(
      forName: NSNotification.Name.NSWorkspaceWillLaunchApplication,
      object: nil, queue: nil,
      using: createHandler(values: values))
}

func start(values: Options) {
  maybeKillExisting(values: values)
  addObserver(values: values)
}

start(values: CommandLine.arguments.dropFirst())

RunLoop.main.run()
