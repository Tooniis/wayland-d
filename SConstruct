env = Environment(tools=["ar", "gdc", "gnulink"])

AddOption(
	"--verbose",
	dest="verbose",
	action="store_true",
	help="verbose output",
)

# Hide tool output by default
if not GetOption("verbose"):
	env.Append(DCOMSTR=["  DC      $SOURCE"])
	env.Append(SHDCOMSTR=env["DCOMSTR"])
	env.Append(LINKCOMSTR=["  LD      $SOURCE"])
	env.Append(SHLINKCOMSTR=env["LINKCOMSTR"])
	env.Append(RANLIBCOMSTR=["  RANLIB  $SOURCE"])
	env.Append(ARCOMSTR=["  AR      $SOURCE"])

# Install path prefix (defaults to /usr)
AddOption(
    "--prefix",
    dest="prefix",
    type="string",
    nargs=1,
    action="store",
    metavar="DIR",
    help="installation prefix",
)

prefix = GetOption("prefix")
if not prefix:
	prefix = "/usr"
env.Append(PREFIX=prefix)

# List of install targets
install = []
Export("install")

Export("env")

SConscript("common/SConscript")
SConscript("client/SConscript")
SConscript("cursor/SConscript")
SConscript("egl/SConscript")
SConscript("server/SConscript")

# Alias to run all install targets
env.Alias("install", install)
