
%token tCONSTANT
%token '.'

// %left '+' '-'
// %left '*' '/'
// %left '^'
// %left UMINUS

%prechigh
%nonassoc tLOWEST
%nonassoc tLBRACE_ARG
    
%left  tLSHFT tRSHFT
%nonassoc  kIF_MOD kUNLESS_MOD kWHILE_MOD kUNTIL_MOD
%left  kOR kAND
%right kNOT
%nonassoc kDEFined
%right '=' tOP_ASGN
%left kRESCUE_MOD
%right '?' ':'
%nonassoc tDOT2 tDOT3
%left  tOROP
%left  tANDOP
%nonassoc  tCMP tEQ tEQQ tNEQ tMATCH tNMATCH
%left  '>' tGEQ '<' tLEQ
%left  '|' '^'
%left  '&'
%left  '+' '-'
%left  '*' '/' '%'
%right tUMINUS_NUM tUMINUS
%right tPOW
%right '!' '~' tUPLUS
%preclow

%%

S
                : program EOF
                  {{
                   cappruby_parser.__result = $1;
                   $$ = $1;
                  }}
                ;

         program: top_compstmt { $$ = new CappRuby.TopNode($1); }
                ;
                  
    top_compstmt: bodystmt opt_terms { $$ = $1; }
                ;
        
        bodystmt: compstmt opt_rescue opt_else opt_ensure
                  {{ $$ = [$1, $2, $3, $4]; }}
                ;
        
        compstmt: stmts opt_terms {{ $$ = $1; }}
                ;
        
       opt_terms: { $$ = null; }
                | terms { $$ = null; }
                ;
      
      opt_rescue: { $$ = []; }
                | RESCUE exc_list exc_var then compstmt opt_rescue
                  {{ $$ = [[$2, $3, $5]].concat($6); }}
                ;
          
        exc_list: arg
                |
                ;
        
         exc_var: ASSOC lhs {{ $$ = $2 }}
                |
                ;
        
        opt_else: { $$ = null; }
                ;
        
      opt_ensure: { $$ = null; }
                ;
                
        top_stmt: stmt
                ;
            
           stmts: none {{ $$ = []; }}
                | stmt {{ $$ = [$1]; }}
                | stmts terms stmt   {{ $$ = $1; $$.push($3); }}
                ;
                
            stmt: stmt IF_MOD expr
                  {{
                    $$ = new CappRuby.IfNode($3, [$1], [], 'if');
                  }}
                | stmt UNLESS_MOD expr
                  {{
                    $$ = new CappRuby.IfNode($3, [$1], [], 'unless');
                  }}
                | stmt WHILE_MOD expr
                  {{
                    $$ = new CappRuby.WhileNode($3, [$1], 'while');
                  }}
                | stmt UNTIL_MOD expr
                  {{
                    $$ = new CappRuby.WhileNode($3, [$1], 'until');
                  }}
                | expr
                ;
            
            expr: command_call
                | arg
                | expr OR expr
                  {{
                    $$ = new CappRuby.OperationNode('||', $1, $3);
                  }}
                | expr AND expr
                  {{
                    $$ = new CappRuby.OperationNode('&&', $1, $3);
                  }}
                | NOT arg
                  {{
                    $$ = new CappRuby.NotNode($2);
                  }}
                ;
          
         op_asgn: OP_ASGN {{ $$ = yytext; }}
                ;
                
             arg: variable '=' expr
                  {{
                    $$ = new CappRuby.AssignNode($1, $3);
                  }}
                | variable op_asgn arg
                  {{
                    $$ = new CappRuby.OpAsgnNode($2, $1, $3);
                  }}
                | arg tDOT2 arg
                  {{
                    $$ = { type:'dot2', start:$1, ending:$3 };
                  }}
                | arg tDOT3 arg
                  {{
                    $$ = { type:'dot3', start:$1, ending:$3 };
                  }}
                | arg '+' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '+', [[$3]]);
                  }}
                | arg '-' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '-', [[$3]]);
                  }}
                | arg '*' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '*', [[$3]]);
                  }}
                | arg '/' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '/', [[$3]]);
                  }}
                | UMINUS arg
                  {{
                    $$ = new CappRuby.CallNode($2, '-@', []);
                  }}
                | UPLUS arg
                  {{
                    $$ = new CappRuby.CallNode($2, '+@', []);
                  }}
                | arg '>' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '>', [[$3]]);
                  }}
                | arg '<' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '<', [[$3]]);
                    }}
                | arg '<=' arg
                  {{  
                    $$ = new CappRuby.CallNode($1, '<=', [[$3]]);
                  }}
                | arg '>=' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '>=', [[$3]]);
                  }}
                | arg '>>' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '>>', [[$3]]);
                  }}
                | arg '<<' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '<<', [[$3]]);
                  }}
                | arg '!~' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '!~', [[$3]]);
                  }}
                | arg '=~' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '=~', [[$3]]);
                  }}
                | arg '==' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '==', [[$3]]);
                  }}
                | arg '===' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '===', [[$3]]);
                  }}
                | arg OROP arg
                  {{
                    $$ = new CappRuby.OperationNode('||', $1, $3);
                  }}
                | arg ANDOP arg
                  {{
                    $$ = new CappRuby.OperationNode('&&', $1, $3);
                  }}
                | '!' arg
                  {{
                    $$ = new CappRuby.NotNode($2);
                  }}
                | arg '?' arg ':' arg
                  {{
                    $$ = new CappRuby.TernaryNode($1, $3, $5);
                  }}
                | primary
                ;
            
             lhs: variable
                // | primary '.' operation
                | backref
                ;
          
         backref: tNTH_REF
                ;
                
          string: STRING_BEGIN string_contents STRING_END
                  {{
                    $$ = new CappRuby.StringNode($2);
                  }}
                ;
    
 string_contents: none
                  {{
                    $$ = [];
                  }}
                | string_contents string_content
                  {{
                    $$ = $1; $1.push($2);
                  }}
                ;
  
  string_content: STRING_CONTENT
                  {{
                    $$ = ['string_content', yytext];
                  }}
                | STRING_DBEG compstmt '}'
                  {{
                    $$ = ['string_dbeg', $2];
                  }}
                ;
          
         xstring: XSTRING_BEGIN xstring_contents XSTRING_END
                  {{
                    $$ = new CappRuby.XStringNode($2);
                  }}
                ;
      
xstring_contents: none
                  {{
                    $$ = [];
                  }}
                | xstring_contents string_content
                  {{
                    $$ = $1; $$.push($2);
                  }}
                ;
        
          regexp: tREGEXP_BEG xstring_contents tREGEXP_END
                  {{
                    $$ = { type:'regexp', value:$2 };
                  }}
                ;
      
      Identifier: IDENTIFIER      {{ $$ = yytext; }}
                ;
                
         primary: COMMENT     {{ $$ = new CappRuby.CommentNode(yytext); }}
                | literal
                | string
                | xstring
                | regexp
                | variable
                | IDENTIFIER do_block
                  {{
                    $$ = new CappRuby.CallNode(null, $1, [null, null, $2]);
                  }}
                | paren_args
                  {{
                    // jison cant quite handle full grammar, so cheeky little hack
                    $$ = new CappRuby.ParenArgsNode($1);
                  }}
                | BEGIN bodystmt END
                  {{
                    $$ = new CappRuby.BeginNode($2);
                  }}
                | method_call
                | method_call brace_block {{ $$ = $1; $1.set_block($2); }}
                | primary '.' operation2 '=' arg
                  {{
                    $$ = new CappRuby.AssignNode(new CappRuby.CallNode($1, $3, [[]]), $5);
                  }}
                | primary COLON2 oper_constant
                  {{
                    $$ = new CappRuby.Colon2Node($1, $3);
                  }}
                | COLON3 oper_constant
                  {{
                    $$ = new CappRuby.Colon3Node($2);
                  }}
                | IF expr then compstmt if_tail END
                  {{
                    $$ = new CappRuby.IfNode($2, $4, $5, 'if');
                  }}
                | UNLESS expr then compstmt opt_else END
                  {{
                    $$ = new CappRuby.IfNode($2, $4, $5, 'unless');
                  }}
                | WHILE expr do compstmt END
                  {{
                    $$ = new CappRuby.WhileNode($2, $4, 'while');
                  }}
                | UNTIL expr do compstmt END
                  {{
                    $$ = new CappRuby.WhileNode($2, $4, 'until');
                  }}
                | CASE expr opt_terms case_body END
                  {{
                    $$ = new CappRuby.CaseNode($2, $4);
                  }}
                | CASE opt_terms case_body END
                  {{
                    $$ = { type:'case', expr:null, body:$3 };
                  }}
                | CLASS cpath superclass bodystmt END
                  {{
                    $$ = new CappRuby.ClassNode($2, $3, $4);
                  }}
                | CLASS '<<' expr term bodystmt END
                  {{
                    $$ = new CappRuby.ClassShiftNode($3, $5);
                  }}
                | kMODULE cpath bodystmt kEND
                  {{
                    $$ = { type:'module', cpath:$2, bodystmt:$3 };
                  }}
                | DEF fname f_arglist bodystmt END
                  {{
                    $$ = new CappRuby.DefNode($2, null, $3, $4);
                  }}
                | DEF singleton dot_or_colon fname f_arglist bodystmt END
                  {{
                    $$ = new CappRuby.DefNode($4, $2, $5, $6);
                  }}
                | ARRAY_BEGIN aref_args ARRAY_END
                  {{
                    $$ = new CappRuby.ArrayNode($2);
                  }}
                | YIELD '(' call_args ')'
                  {{
                    $$ = { type:'yield', call_args:$3 };
                  }}
                | YIELD '(' ')'
                  {{
                    $$ = { type:'yield' };
                  }}
                | YIELD
                  {{
                    $$ = { type:'yield' };
                  }}
                | BREAK
                  {{
                    $$ = new CappRuby.BreakNode();
                  }}
                ;
                
       aref_args: none
                | args
                ;
      
       singleton: variable
                | '(' expr ')'
                ;
      
    dot_or_colon: '.'
                | tCOLON2
                ;
        
       f_arglist: 'PAREN_BEGIN' f_args 'CALL_END'
                  {{ $$ = $2; }}
                | 'CALL_BEGIN' f_args 'CALL_END'
                  {{ $$ = $2; }}
                | f_args term
                  {{ $$ = $1; }}
                ;
          
          f_args: f_arg ',' f_optarg ',' f_rest_arg opt_f_block_arg
                  {{ $$ = [$1, $3, $5, [], $6]; }}
                | f_arg ',' f_optarg ',' f_rest_arg ',' f_arg opt_f_block_arg
                  {{ $$ = [$1, $3, $5, $7, $8]; }}
              	| f_arg ',' f_optarg opt_f_block_arg
              	  {{ $$ = [$1, $3, $5, [], $6]; }}
            		| f_arg ',' f_optarg ',' f_arg opt_f_block_arg
            		  {{ $$ = [$1, $3, $5, [], $6]; }}
            		| f_arg ',' f_rest_arg opt_f_block_arg
            		  {{ $$ = [$1, $3, $5, [], $6]; }}
             		| f_arg ',' f_rest_arg ',' f_arg opt_f_block_arg
             		  {{ $$ = [$1, $3, $5, [], $6]; }}
             		| f_arg opt_f_block_arg
             		  {{ $$ = [$1, $3, $5, [], $6]; }}
            		| f_optarg ',' f_rest_arg opt_f_block_arg
            		  {{ $$ = [$1, $3, $5, [], $6]; }}
            		| f_optarg ',' f_rest_arg ',' f_arg opt_f_block_arg
            		  {{ $$ = [$1, $3, $5, [], $6]; }}
             		| f_optarg opt_f_block_arg
             		  {{ $$ = [$1, $3, $5, [], $6]; }}
            		| f_optarg ',' f_arg opt_f_block_arg
            		  {{ $$ = [$1, $3, $5, [], $6]; }}
              	| f_rest_arg opt_f_block_arg
              	  {{ $$ = [[], [], $1, [], $6]; }}
            		| f_rest_arg ',' f_arg opt_f_block_arg
            		  {{ $$ = [$1, $3, $5, [], $6]; }}
            		| f_block_arg
            		  {{ $$ = [[], [], [], [], $1]; }}
              	| none
              	  {{ $$ = [[], [], [], []]; }}
                ;
                
           f_arg: f_arg_item
                  {{ $$ = [$1]; }}
                | f_arg ',' f_arg_item
                  {{ $$ = $1.concat([$3]); }}
                ;
        
        f_optarg: none
                  {{ $$ = []; }}
                ;
                
      f_rest_arg: restarg_mark Identifier
                  {{
                    $$ = [$2];
                  }}
                ;
  
    restarg_mark: STAR
                | '*'
                ;
                
 opt_f_block_arg: none
                | ',' f_block_arg
                ;
    
f_block_arg_name: IDENTIFIER
                ;

     f_block_arg: blkarg_mark f_block_arg_name
                ;
     
     blkarg_mark: '&'
                | tAMPER
                ;
    
                
      f_arg_item: IDENTIFIER
                  {{ $$ = yytext; }}
                | label Identifier
                  {{ $$ = [$1, $2]; }}
                ;
                
     brace_block: '{' opt_block_param bodystmt '}'
                  {{
                    $$ = new CappRuby.BlockNode($2, $3);
                  }}
                | DO opt_block_param bodystmt END
                  {{
                    $$ = new CappRuby.BlockNode($2, $3);
                  }}
                ;
    
 opt_block_param: none        {{ $$ = [[],[],[],[]]; }}
                | block_param_def
                ;
    
 block_param_def: '|' block_param '|' {{ $$ = $2; }}
                ;
  
     block_param: f_args
                ;
            
         if_tail: opt_else
                | ELSIF expr then compstmt if_tail
                  {{
                    $$ = [['elsif', $2, $4]].concat($5);
                  }}
                ;
        
        opt_else: none
                  {{
                    $$ = [];
                  }}
                | ELSE compstmt
                  {{
                    $$ = [['else', null, $2]];
                  }}
                ;
       
       case_body: WHEN args then compstmt cases
                ;
          
           cases: opt_else
                | case_body
                ;
          
            then: term
                | THEN
                | term THEN
                ;
            
            args: arg {{ $$ = [$1]; }}
                | tSTAR arg {{ $$ = [{ type:'splat', val:$2 }]; }}
                | args ',' arg {{ $$ = $1; $$.push($3); }}
                | args ',' tSTAR arg 
                  {{
                    $$ = $1; $$.push([{ type:'splat', val:$4 }]);
                  }}
                ;
      
    command_call: command
                | block_command
                | YIELD call_args
                  {{
                    $$ = new CappRuby.YieldNode($2);
                  }}
                | BREAK call_args
                  {{
                    $$ = new CappRuby.BreakNode($2);
                  }}
                ;
      
         command: primary call_args
                  {{
                    $$ = new CappRuby.CallNode(null, $1._value, $2);
                  }}
                | primary '.' operation2 call_args
                  {{
                    $$ = new CappRuby.CallNode($1, $3, $4);
                  }}
                | primary '.' operation2 call_args cmd_brace_block
                | primary tCOLON2 operation2 call_args
                | primary tCOLON2 operation2 call_args cmd_brace_block
                | kSUPER call_args
                | YIELD call_args
                ;
      
   block_command: block_call
                ;
    
      block_call: command do_block
                  {{
                    $$ = $1; $1.set_block($2);
                  }}
                ;
                
        do_block: DO opt_block_param bodystmt END
                  {{ 
                    $$ = new CappRuby.BlockNode($2, $3);
                  }}
                ;
    
 cmd_brace_block: '{' '}'
                ;
                
     method_call: operation paren_args
                | primary '.' operation2 opt_paren_args
                  {{ 
                    $$ = new CappRuby.CallNode($1, $3, $4);
                  }}
                | primary 'INDEX_BEGIN' opt_call_args 'ARRAY_END'
                  {{
                    $$ = new CappRuby.CallNode($1, '[]', $3);
                  }}
                | primary 'INDEX_BEGIN' opt_call_args 'ARRAY_END' '=' arg
                  {{
                    $$ = new CappRuby.CallNode($1, '[]=', $3[0].concat([$6]));
                  }}
                ;
       
       operation: IDENTIFIER
                  {{
                    $$ = yytext;
                  }}
                | CONSTANT
                  {{
                    $$ = yytext;
                  }}
                ;
   
      operation2: IDENTIFIER 
                  {{ 
                    $$ = yytext;
                  }}
                ;
    
   oper_constant: CONSTANT {{ $$ = yytext; }}
                ;
      
  opt_paren_args: none
                | paren_args
                ;
      
      paren_args: CALL_BEGIN opt_call_args CALL_END
                  {{
                    $$ = $2;
                  }}
                ;
      
   opt_call_args: none
                | call_args
                ;
      
       call_args: command
                  {{
                    $$ = [[$1], null, null];
                  }}
                | args opt_block_arg
                  {{
                    $$ = [$1, null, $2];
                  }}
                | assocs opt_block_arg
                  {{
                    $$ = [null, $1, $2];
                  }}
                | args ',' assocs opt_block_arg
                  {{
                    $$ = [$1, $3, $4];
                  }}
                | block_arg
                  {{
                    $$ = [null, null, $1];
                  }}
                ;
      
   opt_block_arg: none
                ;
        
          assocs: label_assocs                    {{ $$ = new CappRuby.LabelAssocs($1); }}
                | norm_assocs                     {{ $$ = new CappRuby.Assocs($1); }}
                ;
          
     norm_assocs: assoc                           {{ $$ = [$1]; }}
                | norm_assocs ',' assoc           {{ $$ = $1; $1.push($3); }}
                ;
          
           assoc: arg ASSOC arg                   {{ $$ = [$1, $3]; }}
                ;
        
    label_assocs: label_assoc                     {{ $$ = [$1]; }}
                | label_assocs ',' label_assoc    {{ $$ = $1; $1.push($3); }}
                ;
      
     label_assoc: label arg                       {{ $$ = [$1, $2]; }}
                ;
          
           label: LABEL                           {{ $$ = yytext; }}
                ;
        
        variable: IDENTIFIER    {{ $$ = new CappRuby.IdentifierNode(yytext); }}
                | IVAR          {{ $$ = new CappRuby.IvarNode(yytext); }}
                | GVAR
                | CONSTANT      {{ $$ = new CappRuby.ConstantNode(yytext); }}
                | CVAR
                | NIL           {{ $$ = new CappRuby.NilNode(); }}
                | SELF          {{ $$ = new CappRuby.SelfNode(); }}
                | TRUE          {{ $$ = new CappRuby.TrueNode(); }}
                | FALSE         {{ $$ = new CappRuby.FalseNode(); }}
                | __FILE__ {{ $$ = { type:'__FILE__' }; }}
                | __LINE__
                | __ENCODING__
                | BLOCK_GIVEN
                  {{
                    $$ = { type:'block_given' };
                  }}
                ;
        
      superclass:
                  term {{ $$ = null; }}
                | '<' expr term {{ $$ = $2; }}
                ;
           
           cname: IDENTIFIER { $$ = yytext; }
                | CONSTANT { $$ = yytext; }
                ;
           
           cpath: tCOLON3 cname
                | cname { $$ = $1; }
                | primary_value tCOLON2 cname
                ;
                
         literal: numeric
                | symbol
                ;
        
          symbol: SYMBOL_BEGIN sym {{ $$ = new CappRuby.SymbolNode($2); }}
                ;
            
             sym: fname
                | IVAR    {{ $$ = yytext; }}
                | GVAR    {{ $$ = yytext; }}
                | CVAR    {{ $$ = yytext; }}
                ;
            
           fname: IDENTIFIER { $$ = yytext; }
                | CONSTANT { $$ = yytext }
                | op
                ;
            
              op: '|'      {{ $$ = yytext; }}
                | '^'      {{ $$ = yytext; }}
                | '&'      {{ $$ = yytext; }}
                | '=='      {{ $$ = yytext; }}
                | '==='      {{ $$ = yytext; }}
                | '=~'      {{ $$ = yytext; }}
                | '!~'      {{ $$ = yytext; }}
                | '>'      {{ $$ = yytext; }}
                | '<'      {{ $$ = yytext; }}
                | '>='      {{ $$ = yytext; }}
                | '<='      {{ $$ = yytext; }}
                | '!='      {{ $$ = yytext; }}
                | '<<'      {{ $$ = yytext; }}
                | '>>'      {{ $$ = yytext; }}
                | 'UPLUS'      {{ $$ = yytext; }}
                | 'UMINUS'      {{ $$ = yytext; }}
                | '+'      {{ $$ = yytext; }}
                | '-'      {{ $$ = yytext; }}
                | '*'      {{ $$ = yytext; }}
                | '/'      {{ $$ = yytext; }}
                | '%'      {{ $$ = yytext; }}
                | STAR      {{ $$ = yytext; }}
                | '**'      {{ $$ = yytext; }}
                | '!'      {{ $$ = yytext; }}
                | '~'      {{ $$ = yytext; }}
                | '+@'      {{ $$ = yytext; }}
                | '-@'      {{ $$ = yytext; }}
                | '[]'      {{ $$ = yytext; }}
                | '[]='      {{ $$ = yytext; }}
                | '<=>'     {{ $$ = yytext; }}
                ;
        
         numeric: INTEGER {{ $$ = new CappRuby.NumericNode(yytext); }}
                | FLOAT {{ $$ = new CappRuby.NumericNode(yytext); }}
                ;
              
              do: term
                | DO
                ;
          
            term: ';'
                | '\n'
                ;
                
           terms: term
                | terms ';'
                ;
            
            none: { $$ = null; }
                ;
