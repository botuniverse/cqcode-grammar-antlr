lexer grammar CQCodeLexer;

Text: ~[[]+;

CQCodeOpen: '[' -> pushMode(CQCODE);


/**
 *  处理 CQCode 开头
 */
mode CQCODE;

Signature : 'CQ';

CQCodeColon : ':';

Function_name : [a-z]+ -> pushMode(CQCODE_PARAM_PENDING);

/**
 *  处理 CQCode 的参数键
 */
mode CQCODE_PARAM_START;

CQCodeParamKey : [a-z]+;

CQCodeParamAssign : '=' -> pushMode(CQCODE_PARAM_PENDING);

CQCodeCloseWithoutValue: ']' -> pushMode(DEFAULT_MODE);

/**
 *  处理 CQCode 的参数值
 */
mode CQCODE_PARAM_PENDING;

CQCodeParamValue: ~[,\]]+;

CQCodeParamSplit : ',' -> pushMode(CQCODE_PARAM_START);

CQCodeClose: ']' -> pushMode(DEFAULT_MODE);
