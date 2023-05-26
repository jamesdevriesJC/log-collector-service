CONTEXT_KEY = "context"
LOGS_KEY = "logs"

function cb_split(tag, timestamp, record)
    local context = record[CONTEXT_KEY]
    local logs = record[LOGS_KEY]
    if context == nil then -- no context information, drop the record
    	return -1, timestamp, record
    elseif logs == nil then -- no logs, just log the context
	return 2, timestamp, { context=context }
    end

    -- add context to all log entries
    local logtable = {}
    for _, log in pairs(logs) do
        -- Options for output:
        -- 1. Make new table and put log and context objects in as keys:
        -- This requiers the logtable variable, return that at the end of this function
        -- table.insert(logtable, { log=log, context=context })
        -- 2. Flat structure: Copy the context keys into the log -
        -- for k,v in pairs(context) do log[k] = v end
        -- 3. Context as an object in the log:
        log[CONTEXT_KEY] = context
    end
    return 2, timestamp, logs
end
