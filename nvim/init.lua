-- Require to each files instead of
-- putting everything in one place
package.path = os.getenv("HOME") .. "/.config/nvim/config/?.lua;" .. package.path
require("000-lazy")
require("001-mason")
require("002-config")
require("003-theme")
require("004-mini")
