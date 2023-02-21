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
    for i, log in ipairs(record[LOGS_KEY]) do
	log[CONTEXT_KEY] = context
    end
    return 2, timestamp, record[LOGS_KEY]
end
