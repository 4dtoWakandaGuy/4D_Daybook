//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_SQL_GetDataToArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ArraysReset; 0)
	ARRAY LONGINT:C221($_al_Types; 0)
	//ARRAY REAL(SQL_ar_returnArray;0;0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_SQL_Result; 0; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	//ARRAY TEXT(SQL_at_returnArray;0)
	C_BOOLEAN:C305($_bo_Executed)
	C_LONGINT:C283($_l_FieldNumber; $_l_LoginDelay; $_l_NumberofColumns; $_l_PARAMETERS; $_l_REF; $_l_Strip; $_l_TableNumber; $_l_Transfer; $_l_Transfer2)
	C_OBJECT:C1216($_obj_SqlParameters; $2)
	C_POINTER:C301($_Ptr_array; $_ptr_ParameterArray; $10; $11; $12; $13; $14; $15; $16; $17; $18)
	C_POINTER:C301($19; $20; $21; $22; $23; $24; $25; $26; $27; $28; $29)
	C_POINTER:C301($3; $30; $31; $32; $33; $34; $35; $36; $37; $38; $39)
	C_POINTER:C301($4; $40; $41; $42; $43; $44; $45; $5; $6; $7; $8)
	C_POINTER:C301($9)
	C_TEXT:C284($_t_oldMethodName; $_t_SQLDSN; $_t_SQLPW; $_t_SqlrequestName; $_t_SQLROUTINE; $_t_SQLSOurce; $_t_SQLStatement; $_T_SQLTEXT; $_t_SQLUSER; $_t_VariableName; $1)
	C_TEXT:C284(SQL_t_SQLRequest)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_SQL_GetDataToArrays")


//Database Method Name:      SQL_GetDatatoArrays
//------------------ Method Notes ------------------

//------------------ Revision Control ----------------
If (False:C215)
	//Date Created:  02/07/2019
	//Created BY:  sjp
	
	//Date Modified: 
	//Modified By: sjp
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ArraysReset; 0)
	ARRAY LONGINT:C221($_al_Types; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_SQL_Result; 0; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
End if 
//Code Starts Here

If (Count parameters:C259>=3)
	$_t_SqlrequestName:=$1
	$_obj_SqlParameters:=$2  //any reuired inputs
	//$3 on are pointers to the arrays to return the data in-these must be declared. this method will then convert the data to fit the types of those arrays.
	ARRAY TEXT:C222($_at_SQL_Result; 0; 0)  //A 2 D array for the returned data.
	ARRAY TEXT:C222($_at_Replacements; 0)
	ARRAY TEXT:C222($_at_WhattoReplace; 0)
	
	OB GET PROPERTY NAMES:C1232($_obj_SqlParameters; $_at_Properties; $_al_Types)
	If (Find in array:C230($_at_Properties; "ReplaceWhat")>0) & (Find in array:C230($_at_Properties; "ReplaceWith")>0)
		OB GET ARRAY:C1229($_obj_SqlParameters; "ReplaceWith"; $_at_Replacements)
		OB GET ARRAY:C1229($_obj_SqlParameters; "ReplaceWhat"; $_at_WhattoReplace)
	End if 
	$_T_SQLTEXT:=""
	$_l_REF:=Find in array:C230($_at_Properties; "SQLTEXT")
	If ($_l_REF>0)
		$_T_SQLTEXT:=OB Get:C1224($_obj_SqlParameters; "SQLTEXT")
	End if 
	If ($_T_SQLTEXT="")
		TREND_SQLgetData($_t_SqlrequestName; ->$_at_Replacements; ->$_at_WhattoReplace; ->$_at_SQL_Result)
		ARRAY BOOLEAN:C223($_abo_ArraysReset; 0)
		ARRAY BOOLEAN:C223($_abo_ArraysReset; 99)
		
		If (Size of array:C274($_at_SQL_Result)>0)
			
			For ($_l_Transfer; 1; Size of array:C274($_at_SQL_Result))  //go through each row--each row is going to the next parameter
				//For ($_l_Transfer2;1;Size of array($_at_SQL_Result{$_l_Transfer})  //go through each column
				If ((Count parameters:C259-2)>=$_l_Transfer)  //in case we did not pass enough parameters-can only get the data into the arrays passed
					$_ptr_ParameterArray:=${$_l_Transfer+2}  //the first two parameters are the call name and the replace data
					Case of 
						: (Type:C295($_ptr_ParameterArray->)=Is date:K8:7) | (Type:C295($_ptr_ParameterArray->)=17)
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY DATE:C224($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							For ($_l_Transfer2; 1; Size of array:C274($_at_SQL_Result{$_l_Transfer}))
								APPEND TO ARRAY:C911($_ptr_ParameterArray->; Date:C102($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							End for 
							
						: (Type:C295($_ptr_ParameterArray->)=Is time:K8:8) | (Type:C295($_ptr_ParameterArray->)=32)
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY TIME:C1223($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							For ($_l_Transfer2; 1; Size of array:C274($_at_SQL_Result{$_l_Transfer}))
								
								APPEND TO ARRAY:C911($_ptr_ParameterArray->; Time:C179($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							End for 
						: (Type:C295($_ptr_ParameterArray->)=Is longint:K8:6) | (Type:C295($_ptr_ParameterArray->)=16)
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY LONGINT:C221($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							For ($_l_Transfer2; 1; Size of array:C274($_at_SQL_Result{$_l_Transfer}))
								APPEND TO ARRAY:C911($_ptr_ParameterArray->; Num:C11($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							End for 
						: (Type:C295($_ptr_ParameterArray->)=Is real:K8:4) | (Type:C295($_ptr_ParameterArray->)=14)
							
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY REAL:C219($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							For ($_l_Transfer2; 1; Size of array:C274($_at_SQL_Result{$_l_Transfer}))
								APPEND TO ARRAY:C911($_ptr_ParameterArray->; Num:C11($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							End for 
						: (Type:C295($_ptr_ParameterArray->)=Is integer:K8:5) | (Type:C295($_ptr_ParameterArray->)=15)
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY LONGINT:C221($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							For ($_l_Transfer2; 1; Size of array:C274($_at_SQL_Result{$_l_Transfer}))
								APPEND TO ARRAY:C911($_ptr_ParameterArray->; Num:C11($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							End for 
						: (Type:C295($_ptr_ParameterArray->)=Is text:K8:3) | (Type:C295($_ptr_ParameterArray->)=18)
							
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY TEXT:C222($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							//For ($_l_Transfer2;1;Size of array($_at_SQL_Result{$_l_Transfer})
							//APPEND TO ARRAY($_ptr_ParameterArray->;($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							//End for 
							COPY ARRAY:C226($_at_SQL_Result{$_l_Transfer}; $_ptr_ParameterArray->)
							
						Else 
							If (Not:C34($_abo_ArraysReset{$_l_Transfer}))  //we have not reset this array-we keep this simple 
								If (Size of array:C274($_ptr_ParameterArray->)>0)
									ARRAY TEXT:C222($_ptr_ParameterArray->; 0)
								End if 
								$_abo_ArraysReset{$_l_Transfer}:=True:C214
							End if 
							For ($_l_Transfer2; 1; Size of array:C274($_at_SQL_Result{$_l_Transfer}))
								APPEND TO ARRAY:C911($_ptr_ParameterArray->; ($_at_SQL_Result{$_l_Transfer}{$_l_Transfer2}))
							End for 
							//Copy array($_at_SQL_Result{$_l_Transfer};$_ptr_ParameterArray->)
							
					End case 
				End if 
				//End for 
			End for 
			
		End if 
	Else 
		//TREND_SQLgetData ($_t_SqlrequestName;->$_at_Replacements;->$_at_WhattoReplace;->$_at_SQL_Result)
		
		$_t_SQLStatement:=TREND_Sql_Builder($_t_SqlrequestName; ->$_l_NumberofColumns; ->$_t_SQLSOurce; ->$_t_SQLDSN; ->$_t_SQLUSER; ->$_t_SQLPW)
		//WE WILL IGNORE SQL STATEMENT
		If (False:C215)
			$_T_SQLTEXT:=$_T_SQLTEXT+" INTO "
			For ($_l_PARAMETERS; 3; Count parameters:C259)
				RESOLVE POINTER:C394(${$_l_PARAMETERS}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				If ($_l_PARAMETERS<Count parameters:C259)
					$_T_SQLTEXT:=$_T_SQLTEXT+":"+$_t_VariableName+", "
				Else 
					$_T_SQLTEXT:=$_T_SQLTEXT+":"+$_t_VariableName+";"
				End if 
			End for 
			
		End if 
		While (Semaphore:C143("ODBCINUSE"))
			IDLE:C311
			UTIL_DelayTicks((2+$_l_LoginDelay)*60)
			$_l_LoginDelay:=$_l_LoginDelay+1
			If ($_l_LoginDelay>(30))  //it the delay has goto to 30 seconds
				$_l_LoginDelay:=1
			End if 
			
		End while 
		SQL SET OPTION:C818(SQL connection timeout:K49:8; 12)
		SQL SET OPTION:C818(SQL query timeout:K49:7; 12)
		$_bo_Executed:=False:C215
		SQL_t_SQLRequest:=$_T_SQLTEXT
		Repeat 
			//ON ERR CALL("SQL_ConnectionErrorHandler")
			Repeat 
				SQL LOGIN:C817($_t_SQLDSN; $_t_SQLUSER; $_t_SQLPW)
				
				If (OK=0)
					//Log_CurrentStatus(0;"in SQL_Get Data ("+$1+") -Connection Failed will retry")
					
					DELAY PROCESS:C323(Current process:C322; 60*60*5)
				Else 
					//Log_CurrentStatus(0;"SQL Login Done ("+$1+")")
					
				End if 
			Until (OK=1)
			Case of 
				: ($_l_NumberofColumns=43)
					//TRACE
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->; $40->; $41->; $42->; $43->; $44->; $45->)
					$_bo_Executed:=(OK=1)
					
					//TRACE
					
				: ($_l_NumberofColumns=42)
					//TRACE
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->; $40->; $41->; $42->; $43->; $44->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=41)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->; $40->; $41->; $42->; $43->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=40)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->; $40->; $41->; $42->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=39)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->; $40->; $41->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=38)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->; $40->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=37)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->; $39->)
					$_bo_Executed:=(OK=1)
					
				: ($_l_NumberofColumns=36)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->; $38->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=35)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->; $37->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=34)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->; $36->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=1)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=2)
					$_bo_Executed:=(OK=1)
					
					
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->)
					$_bo_Executed:=(OK=1)
					
					
				: ($_l_NumberofColumns=3)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=33)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->; $35->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=32)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->; $34->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=31)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->; $33->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=30)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->; $32->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=29)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->; $31->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=28)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->; $30->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=27)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->; $29->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=26)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->; $28->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=25)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->; $27->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=24)
					
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->; $26->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=23)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->; $25->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=22)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->; $24->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=21)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->; $23->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=20)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->; $22->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=19)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->; $21->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=18)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->; $20->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=17)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->; $19->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=16)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->; $18->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=15)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->; $17->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=14)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->; $16->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=13)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->; $15->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=12)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->; $14->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=11)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->; $13->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=10)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->; $12->)
					$_bo_Executed:=(OK=1)
					
				: ($_l_NumberofColumns=9)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->; $11->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=8)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->; $10->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=7)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->; $9->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=6)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->; $8->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=5)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->; $7->)
					$_bo_Executed:=(OK=1)
				: ($_l_NumberofColumns=4)
					SQL EXECUTE:C820($_T_SQLTEXT; $3->; $4->; $5->; $6->)
					$_bo_Executed:=(OK=1)
					
					
					
					
			End case 
			
			
			
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			
			SQL LOGOUT:C872
			ON ERR CALL:C155("")
			CLEAR SEMAPHORE:C144("ODBCINUSE")
		Until ($_bo_Executed)  //if the connection timed out
		For ($_l_PARAMETERS; 3; Count parameters:C259)
			$_Ptr_array:=${$_l_PARAMETERS}
			For ($_l_Strip; 1; Size of array:C274($_Ptr_array->))
				If (Type:C295($_Ptr_array->)=Text array:K8:16)
					If (Position:C15(" "; $_Ptr_array->{$_l_Strip})>0)
						
						$_Ptr_array->{$_l_Strip}:=STR_RemoveLeadTrailSpace($_Ptr_array->{$_l_Strip})
					End if 
				End if 
			End for 
		End for 
		
	End if 
End if 
ERR_MethodTrackerReturn("TREND_SQL_GetDataToArrays"; $_t_oldMethodName)
