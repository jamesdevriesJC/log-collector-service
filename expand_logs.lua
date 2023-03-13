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
        table.insert(logtable, { log=log, context=context })
    end
    return 2, timestamp, logtable
end
