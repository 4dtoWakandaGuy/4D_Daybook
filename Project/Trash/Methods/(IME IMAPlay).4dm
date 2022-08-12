//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      IME IMAPlay
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
	C_LONGINT:C283($_l_BracketPosition)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_ImaScript; $_t_oldMethodName; $_t_Par2; $_t_Par3; $_t_Par4; $_t_Parameter1; $_t_Title2; $_t_Title3; $1; vDesc; vMtitle2)
	C_TEXT:C284(vmTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME IMAPlay")

//******************************************************************************
//
//Method: IME_IMAPlay
//
//Written by  Rollo on 27/5/2004
//
//Purpose: play IMA,  including passed parameters
//
$_t_oldMethodName:=ERR_MethodTracker("IME IMAPlay")

If (Count parameters:C259<3)
	$_t_Title2:=vMtitle2
	$_t_Title3:=vmTitle3
Else 
	$_t_Title2:=$2->
	$_t_Title3:=$3->
End if 
//If (double quote="")
//double quote:=Char(34)
//End if 
$_t_ImaScript:=$1
$_l_BracketPosition:=Position:C15("("; $_t_Title3)  //don't execute if can avoid it
If ($_l_BracketPosition=0)
	Macro2($_t_ImaScript)
Else 
	//$_t_Parameter1:=STR_FirstParam (vDesc)
	$_t_Parameter1:=First_Param($_t_Title2)
	$_t_Par2:=Substring:C12($_t_Title2; $_l_BracketPosition+1; Length:C16($_t_Title2)-$_l_BracketPosition)
	
	If ((Character code:C91(Substring:C12($_t_Parameter1; 1; 1))#34) | ($_t_Par2="@+@"))  //ie if has any 4D proc, must execute
		//vDesc:="Macro2 ("+Double quote+Double quote+";"+Double quote+$_t_ImaScript+Double quote+";"+STR_StringLiteral ($_t_Par2)
		EXECUTE FORMULA:C63(vDesc)
	Else 
		
		If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
			Macro2($_t_ImaScript; ""; STR_StringLiteral(STR_RemQuote($_t_Parameter1)))  //Rollo 6/10/99
		Else 
			
			//$_t_Par2:=STR_FirstParam (vDesc)
			$_t_Par2:=First_Param($_t_Title2)
			If ((Character code:C91(Substring:C12($_t_Par2; 1; 1))#34) | ($_t_Parameter1="@+@") | ($_t_Parameter1="@[@") | ($_t_Parameter1="@(@"))
				//vDesc:="Macro2 ("+Double quote+Double quote+";"+Double quote+$_t_ImaScript+Double quote+";"+STR_StringLiteral (Substring($_t_Title2;$_l_BracketPosition+1;Length($_t_Title2)-$_l_BracketPosition))
				EXECUTE FORMULA:C63(vDesc)
			Else 
				
				If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
					Macro2($_t_ImaScript; ""; ""; 0; STR_StringLiteral(STR_RemQuote($_t_Parameter1)); STR_StringLiteral(STR_RemQuote($_t_Par2)))  //Rollo 6/10/99
				Else 
					
					//$_t_Par3:=STR_FirstParam (vDesc)
					$_t_Par3:=First_Param($_t_Title2)
					If (Character code:C91(Substring:C12($_t_Par3; 1; 1))#34)
						//vDesc:="Macro2 ("+Double quote+Double quote+";"+Double quote+$_t_ImaScript+Double quote+";"+STR_StringLiteral (Substring($_t_Title2;$_l_BracketPosition+1;Length($_t_Title2)-$_l_BracketPosition))
						EXECUTE FORMULA:C63(vDesc)
					Else 
						
						If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
							Macro2($_t_ImaScript; ""; ""; 0; STR_StringLiteral(STR_RemQuote($_t_Parameter1)); STR_StringLiteral(STR_RemQuote($_t_Par2)); STR_StringLiteral(STR_RemQuote($_t_Par3)))  //Rollo 6/10/99
						Else 
							
							//$_t_Par4:=STR_FirstParam (vDesc)
							$_t_Par4:=First_Param($_t_Title2)
							If (Character code:C91(Substring:C12($_t_Par4; 1; 1))#34)
								//vDesc:="Macro2 ("+Double quote+Double quote+";"+Double quote+$_t_ImaScript+Double quote+";"+STR_StringLiteral (Substring($_t_Title2;$_l_BracketPosition+1;Length($_t_Title2)-$_l_BracketPosition))
								EXECUTE FORMULA:C63(vDesc)
							Else 
								
								If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
									Macro2($_t_ImaScript; ""; ""; 0; STR_StringLiteral(STR_RemQuote($_t_Parameter1)); STR_StringLiteral(STR_RemQuote($_t_Par2)); STR_StringLiteral(STR_RemQuote($_t_Par3)); STR_StringLiteral(STR_RemQuote($_t_Par4)))  //Rollo 6/10/99
								Else 
									
									//vDesc:="Macro2 ("+Double quote+Double quote+";"+Double quote+$_t_ImaScript+Double quote+";"+STR_StringLiteral (Substring($_t_Title2;$_l_BracketPosition+1;Length($_t_Title2)-$_l_BracketPosition))
									EXECUTE FORMULA:C63(vDesc)
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
End if 
If (Count parameters:C259<3)
	vMtitle2:=$_t_Title2
	vmTitle3:=$_t_Title3
Else 
	$2->:=$_t_Title2
	$3->:=$_t_Title3
End if 
ERR_MethodTrackerReturn("IME IMAPlay"; $_t_oldMethodName)