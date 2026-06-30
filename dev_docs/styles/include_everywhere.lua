-- include_everywhere.lua
-- 1) Expand @include in normal text
-- 2) Expand @include inside YAML code blocks
-- 3) Automatically add current date/time to metadata

local function read_file(path)
  local fh = io.open(path, "r")
  if not fh then
    io.stderr:write("Cannot open file for @include: " .. path .. "\n")
    return ""
  end
  local content = fh:read("*a")
  fh:close()
  return content
end

-- Expand @include in normal text
local function expand_inlines(inlines)
  return inlines:walk {
    Str = function(str)
      local txt = str.text
      local path = txt:match("^@include%s+(.+)$")
      if path then
        local replacement = read_file(path)
        return pandoc.RawInline("markdown", replacement)
      end
    end
  }
end

-- Expand @include inside YAML code blocks
local function expand_yaml_codeblocks(cb)
  if cb.classes[1] == "yaml" then
    local new = cb.text:gsub("@include%s+([%w%-%./_]+)", function(path)
      return read_file(path)
    end)
    cb.text = new
    return cb
  end
end

-- Add current date/time to metadata
local function add_date(meta)
  if not meta.date then
    meta.date = os.date("%Y-%m-%d %H:%M:%S")
  end
  return meta
end

-- Return all filters in a single table
return {
  { Inlines = expand_inlines },
  { CodeBlock = expand_yaml_codeblocks },
  { Meta = add_date }
}
