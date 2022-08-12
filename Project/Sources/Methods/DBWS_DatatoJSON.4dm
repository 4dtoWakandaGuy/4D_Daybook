//%attributes = {}

If (False:C215)
	//Project Method Name:      DBWS_DatatoJSON
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_1stCurlyFound; $_bo_Exit)
	C_LONGINT:C283($_l_CharPosition; $_l_DataType; $_l_Index; $_l_LabelParameter; $_l_ParametersIndex; $_l_RecordsinSelection; $_l_TableNumber; $_l_ValueParameter)
	C_POINTER:C301($_ptr_Label; $_ptr_TableNumber; $_ptr_ThisValue; $1; $10; $11; $2; $3; $4; $5; $6)
	C_POINTER:C301($7; $8; $9)
	C_TEXT:C284($_t_InsertElementString; $_t_InsetObjectString; $_t_Label; $_t_LabelValue; $_t_oldMethodName; $_t_PrefixString; $_t_SuffixString; $_t_TypeString; $0)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DBWS_DatatoJSON")



//C_LONGINT($_l_TableNumber)
//C_TEXT($1;$2)
//C_LONGINT($3)
//C_TEXT($4)
$_t_oldMethodName:=ERR_MethodTracker("DBWS_DatatoJSON")
If (Count parameters:C259>=5)
	$_t_TypeString:="STRING"
	Case of 
		: ($1->="STRING")
			$_t_TypeString:="STRING"
		: ($1->="ARRAY")
			$_t_TypeString:="ARRAY"
	End case 
	$_t_PrefixString:=""
	$_t_SuffixString:=""
	If ($2->#"")
		If ($3->>0) & ($3-><Length:C16($2->))  //to append just pass a number larger than or equal to the length of the string
			$_t_PrefixString:=Substring:C12($2->; 1; $3->)
			$_t_SuffixString:=Substring:C12($2->; $3->+1)
			
		Else 
			//add to the end..but that means add elements
			//?? how would you add elements to a sub element!!!-suggest they get
			//if the element are an array the last (important) character is a ]
			//if the elements are a string then the last (importand character is a } but with the array there may be a } after
			$_l_CharPosition:=Length:C16($2->)
			$_bo_1stCurlyFound:=False:C215
			$_bo_Exit:=False:C215
			Repeat 
				If ($2->[[$_l_CharPosition]]="}")
					If ($_bo_1stCurlyFound)
						$_t_PrefixString:=Substring:C12($2->; 1; $_l_CharPosition-1)
						$_t_SuffixString:=Substring:C12($2->; $_l_CharPosition)
					End if 
				End if 
				If ($2->[[$_l_CharPosition]]="]")
					$_t_PrefixString:=Substring:C12($2->; 1; $_l_CharPosition-1)
					$_t_SuffixString:=Substring:C12($2->; $_l_CharPosition)
					
				End if 
				$_l_CharPosition:=$_l_CharPosition-1
				If ($_l_CharPosition=0)
					$_bo_Exit:=True:C214
				End if 
			Until ($_bo_Exit)
		End if 
		
	End if 
	$_l_DataType:=Type:C295($6->)
	If (Is a variable:C294($6))
		$_l_RecordsinSelection:=Size of array:C274($6->)
		
	Else 
		$_l_TableNumber:=Table:C252($6)
		$_ptr_TableNumber:=Table:C252($_l_TableNumber)
		$_l_RecordsinSelection:=Records in selection:C76($_ptr_TableNumber->)
	End if 
	$_t_InsetObjectString:=""
	$_t_InsertElementString:=""
	For ($_l_Index; 1; $_l_RecordsinSelection)
		If (Count parameters:C259=6) & ($5->="")  //there is only one array AND $5 is blank..just put the value in
			
			If ($_l_Index=1)
				If (Is a variable:C294($6))
					Case of 
						: (Type:C295($6->)=Text array:K8:16) | (Type:C295($6->)=String array:K8:15)
							$_t_InsertElementString:=$6->{$_l_Index}
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Date array:K8:20)
							$_t_InsertElementString:=String:C10($6->{$_l_Index})
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Boolean array:K8:21)
							If ($6->{$_l_Index})
								$_t_InsertElementString:="TRUE"
							Else 
								$_t_InsertElementString:="FALSE"
							End if 
						: (Type:C295($6->)=Integer array:K8:18) | (Type:C295($6->)=LongInt array:K8:19) | (Type:C295($6->)=Real array:K8:17)
							$_t_InsertElementString:=String:C10($6->{$_l_Index})
							
					End case 
				Else 
					FIRST RECORD:C50($_ptr_TableNumber->)
					Case of 
						: (Type:C295($6->)=Is text:K8:3) | (Type:C295($6->)=Is alpha field:K8:1)
							$_t_InsertElementString:=($6->)
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Is date:K8:7)
							$_t_InsertElementString:=String:C10($6->)
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Is boolean:K8:9)
							If ($6->)
								$_t_InsertElementString:="TRUE"
							Else 
								$_t_InsertElementString:="FALSE"
							End if 
						: (Type:C295($6->)=Is integer:K8:5) | (Type:C295($6->)=Is longint:K8:6) | (Type:C295($6->)=Is real:K8:4)
							$_t_InsertElementString:=String:C10($6->)
							
					End case 
					NEXT RECORD:C51($_ptr_TableNumber->)
				End if 
				$_t_InsetObjectString:=$_t_InsetObjectString+$_t_InsertElementString
			Else 
				If (Is a variable:C294($6))
					Case of 
						: (Type:C295($6->)=Text array:K8:16) | (Type:C295($6->)=String array:K8:15)
							$_t_InsertElementString:=$6->{$_l_Index}
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Date array:K8:20)
							$_t_InsertElementString:=String:C10($6->{$_l_Index})
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Boolean array:K8:21)
							If ($6->{$_l_Index})
								$_t_InsertElementString:="TRUE"
							Else 
								$_t_InsertElementString:="FALSE"
							End if 
						: (Type:C295($6->)=Integer array:K8:18) | (Type:C295($6->)=LongInt array:K8:19) | (Type:C295($6->)=Real array:K8:17)
							$_t_InsertElementString:=String:C10($6->{$_l_Index})
							
					End case 
				Else 
					
					Case of 
						: (Type:C295($6->)=Is text:K8:3) | (Type:C295($6->)=Is alpha field:K8:1)
							$_t_InsertElementString:=$6->
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Is date:K8:7)
							$_t_InsertElementString:=String:C10($6->)
							$_t_InsertElementString:=Char:C90(34)+$_t_InsertElementString
							$_t_InsertElementString:=$_t_InsertElementString+Char:C90(34)
						: (Type:C295($6->)=Is boolean:K8:9)
							If ($6->)
								$_t_InsertElementString:="TRUE"
							Else 
								$_t_InsertElementString:="FALSE"
							End if 
						: (Type:C295($6->)=Is integer:K8:5) | (Type:C295($6->)=Is longint:K8:6) | (Type:C295($6->)=Is real:K8:4)
							$_t_InsertElementString:=String:C10($6->)
							
					End case 
					NEXT RECORD:C51($_ptr_TableNumber->)
				End if 
				$_t_InsetObjectString:=$_t_InsetObjectString+","+$_t_InsertElementString
			End if 
		Else 
			//we will be inserting label and value pairs
			For ($_l_ParametersIndex; 5; Count parameters:C259; 2)
				$_l_LabelParameter:=$_l_ParametersIndex
				$_l_ValueParameter:=$_l_ParametersIndex+1
				$_ptr_ThisValue:=${$_l_ValueParameter}
				$_ptr_Label:=${$_l_LabelParameter}
				$_t_LabelValue:=$_ptr_Label->
				If ($_l_ParametersIndex=5)
					If (Is a variable:C294($_ptr_ThisValue))
						Case of 
							: (Type:C295($_ptr_ThisValue->)=Text array:K8:16) | (Type:C295($_ptr_ThisValue)=String array:K8:15)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_LabelValue+":"+Char:C90(34)+$_ptr_ThisValue->{$_l_Index}+Char:C90(34)
								Else 
									$_t_InsertElementString:=Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+$_ptr_ThisValue->{$_l_Index}+Char:C90(34)
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Date array:K8:20)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_LabelValue+":"+Char:C90(34)+String:C10($_ptr_ThisValue->{$_l_Index})+Char:C90(34)
								Else 
									$_t_InsertElementString:=Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+String:C10($_ptr_ThisValue->{$_l_Index})+Char:C90(34)
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Boolean array:K8:21)
								If ($_t_TypeString="ARRAY")
									If ($_ptr_ThisValue->{$_l_Index})
										$_t_InsertElementString:=$_t_LabelValue+":"+Char:C90(34)+"TRUE"+Char:C90(34)
									Else 
										$_t_InsertElementString:=$_t_LabelValue+":"+Char:C90(34)+"FALSE"+Char:C90(34)
									End if 
								Else 
									If ($_ptr_ThisValue->{$_l_Index})
										$_t_InsertElementString:=Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+"TRUE"+Char:C90(34)
									Else 
										$_t_InsertElementString:=Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+"FALSE"+Char:C90(34)
									End if 
								End if 
							: (Type:C295($_ptr_ThisValue->)=Integer array:K8:18) | (Type:C295($_ptr_ThisValue->)=LongInt array:K8:19) | (Type:C295($_ptr_ThisValue->)=Real array:K8:17)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_LabelValue+":"+String:C10($6->{$_l_Index})
								Else 
									$_t_InsertElementString:=Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+String:C10($6->{$_l_Index})+Char:C90(34)
								End if 
						End case 
					Else 
						FIRST RECORD:C50($_ptr_TableNumber->)
						$_ptr_Label:=${$_l_LabelParameter}
						$_t_Label:=$_ptr_Label->
						If ($_t_Label="")
							$_t_Label:=Field name:C257($_ptr_ThisValue)
						End if 
						Case of 
							: (Type:C295($_ptr_ThisValue->)=Is text:K8:3) | (Type:C295($_ptr_ThisValue->)=Is alpha field:K8:1)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_Label+":"+Char:C90(34)+$_ptr_ThisValue->+Char:C90(34)
								Else 
									$_t_InsertElementString:=Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+$_ptr_ThisValue->+Char:C90(34)
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Is date:K8:7)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_Label+":"+Char:C90(34)+String:C10($_ptr_ThisValue->)+Char:C90(34)
									
								Else 
									$_t_InsertElementString:=Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+String:C10($_ptr_ThisValue->)+Char:C90(34)
									
								End if 
							: (Type:C295($_ptr_ThisValue->)=Is boolean:K8:9)
								If ($_t_TypeString="ARRAY")
									If ($_ptr_ThisValue->)
										$_t_InsertElementString:=$_t_Label+":"+"TRUE"
									Else 
										$_t_InsertElementString:=$_t_Label+":"+"FALSE"
									End if 
								Else 
									If ($_ptr_ThisValue->)
										$_t_InsertElementString:=Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+"TRUE"+Char:C90(34)
									Else 
										$_t_InsertElementString:=Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+"FALSE"+Char:C90(34)
									End if 
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Is integer:K8:5) | (Type:C295($_ptr_ThisValue->)=Is longint:K8:6) | (Type:C295($_ptr_ThisValue->)=Is real:K8:4)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_Label+":"+String:C10($_ptr_ThisValue->)
								Else 
									$_t_InsertElementString:=Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+String:C10($_ptr_ThisValue->)+Char:C90(34)
									
								End if 
						End case 
						
					End if 
					
				Else 
					If (Is a variable:C294($_ptr_ThisValue))
						Case of 
							: (Type:C295($_ptr_ThisValue->)=Text array:K8:16) | (Type:C295($_ptr_ThisValue->)=String array:K8:15)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_InsertElementString+","+$_t_LabelValue+":"+Char:C90(34)+$_ptr_ThisValue->{$_l_Index}+Char:C90(34)
								Else 
									$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+$_ptr_ThisValue->{$_l_Index}+Char:C90(34)
									
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Date array:K8:20)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_InsertElementString+","+$_t_LabelValue+":"+Char:C90(34)+String:C10($_ptr_ThisValue->{$_l_Index})+Char:C90(34)
								Else 
									$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+String:C10($_ptr_ThisValue->{$_l_Index})+Char:C90(34)
									
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Boolean array:K8:21)
								If ($_t_TypeString="ARRAY")
									If ($_ptr_ThisValue->{$_l_Index})
										$_t_InsertElementString:=$_t_InsertElementString+","+$_t_LabelValue+":"+"TRUE"
										
									Else 
										$_t_InsertElementString:=$_t_InsertElementString+","+$_t_LabelValue+":"+"FALSE"
									End if 
								Else 
									If ($_ptr_ThisValue->{$_l_Index})
										$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+"TRUE"+Char:C90(34)
										
									Else 
										$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+"FALSE"+Char:C90(34)
									End if 
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Integer array:K8:18) | (Type:C295($_ptr_ThisValue->)=LongInt array:K8:19) | (Type:C295($_ptr_ThisValue->)=Real array:K8:17)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_InsertElementString+","+$_t_LabelValue+":"+String:C10($6->{$_l_Index})
								Else 
									$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_LabelValue+Char:C90(34)+":"+Char:C90(34)+String:C10($6->{$_l_Index})+Char:C90(34)
									
								End if 
						End case 
					Else 
						$_ptr_Label:=${$_l_LabelParameter}
						
						$_t_Label:=$_ptr_Label->
						If ($_t_Label="")
							$_t_Label:=Field name:C257($_ptr_ThisValue)
						End if 
						Case of 
							: (Type:C295($_ptr_ThisValue->)=Is text:K8:3) | (Type:C295($_ptr_ThisValue->)=Is alpha field:K8:1)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_InsertElementString+","+$_t_Label+":"+Char:C90(34)+$_ptr_ThisValue->+Char:C90(34)
								Else 
									$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+$_ptr_ThisValue->+Char:C90(34)
									
								End if 
								
								
							: (Type:C295($_ptr_ThisValue->)=Is date:K8:7)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_InsertElementString+","+$_t_Label+":"+Char:C90(34)+String:C10($_ptr_ThisValue->)+Char:C90(34)
								Else 
									$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+String:C10($_ptr_ThisValue->)+Char:C90(34)
								End if 
								
							: (Type:C295($_ptr_ThisValue->)=Is boolean:K8:9)
								If ($_t_TypeString="ARRAY")
									If ($_ptr_ThisValue->)
										$_t_InsertElementString:=$_t_InsertElementString+","+$_t_Label+":"+"TRUE"
									Else 
										$_t_InsertElementString:=$_t_InsertElementString+","+$_t_Label+":"+"FALSE"
									End if 
								Else 
									If ($_ptr_ThisValue->)
										$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+"TRUE"+Char:C90(34)
									Else 
										$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+"FALSE"+Char:C90(34)
										
									End if 
								End if 
							: (Type:C295($_ptr_ThisValue->)=Is integer:K8:5) | (Type:C295($_ptr_ThisValue->)=Is longint:K8:6) | (Type:C295($_ptr_ThisValue->)=Is real:K8:4)
								If ($_t_TypeString="ARRAY")
									$_t_InsertElementString:=$_t_InsertElementString+","+$_t_Label+":"+String:C10($_ptr_ThisValue->)
								Else 
									$_t_InsertElementString:=$_t_InsertElementString+","+Char:C90(34)+$_t_Label+Char:C90(34)+":"+Char:C90(34)+String:C10($_ptr_ThisValue->)+Char:C90(34)
								End if 
								
						End case 
						
					End if 
					//$_t_InsetObjectString:=$_t_InsetObjectString+","+$_t_InsertElementString
				End if 
				
			End for 
			If ($_l_Index=1)
				$_t_InsetObjectString:=$_t_InsetObjectString+"{"+$_t_InsertElementString+"}"
			Else 
				$_t_InsetObjectString:=$_t_InsetObjectString+", {"+$_t_InsertElementString+"}"
			End if 
			
		End if 
	End for 
End if 
If ($_t_TypeString="ARRAY")
	
	$_t_InsetObjectString:="["+$_t_InsetObjectString+"]"
Else 
	$_t_InsetObjectString:="["+$_t_InsetObjectString+"]"
End if 
If ($4->#"") & ($_t_TypeString#"ARRAY")
	$_t_InsetObjectString:="{"+Char:C90(34)+($4->)+Char:C90(34)+":"+$_t_InsetObjectString+"}"
	
End if 
$0:=$_t_InsetObjectString









//
ERR_MethodTrackerReturn("DBWS_DatatoJSON"; $_t_oldMethodName)