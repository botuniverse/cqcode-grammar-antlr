parser grammar CQCodeParser;
options { tokenVocab = CQCodeLexer; }

message: message_segment*;

message_segment: text | cqcode;

text: Text;

cqcode
    : CQCodeOpen Signature CQCodeColon Function_name (CQCodeCloseWithoutValue | CQCodeClose)
    | CQCodeOpen Signature CQCodeColon Function_name cqcode_params (CQCodeClose | CQCodeCloseWithoutValue);

cqcode_params: cqcode_param+;

cqcode_param
            : CQCodeParamSplit CQCodeParamKey (CQCodeParamAssign CQCodeParamValue)?;