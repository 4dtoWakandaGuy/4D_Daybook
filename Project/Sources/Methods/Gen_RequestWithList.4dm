//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_RequestWithList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListItemIDS; 0)
	ARRAY TEXT:C222($_at_ListItemNames; 0)
	//ARRAY TEXT(GEN_at_ComboBoxValues;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; Gen_bo_UseComboBoxPage; IME_bo_FromWebRequest)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_FIxedHeight; $_l_FixedWIdth; $_l_Index; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $5; $6; $8; GEN_l_Amount; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_Ptr_ValuesArray)
	C_REAL:C285(GEN_R_Amount)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $0; $1; $10; $2; $3; $4; $7; $9)
	C_TEXT:C284(vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_RequestWithList")

//this is an enhanced version of Gen request. It uses a combo box in the form to have a 'pop-up'
//this is where you are requesting the user to enter a value but the value must be one of a range.
//As with Gen request the following vars are set

//$1=Message to display
//$2=Default return value(or blank)
//$0=the returned value

//$3=Text for Ok button
//$4 text for cancel button

//$5=Window left postion(0 for default--this is changed from gen request where it is an option to send..here if a list is being passed then $5 will also be passed
//$6=windo top postion see $5 for notes
//$7 =window title=see $5 for notes
//$8=List id
//$9 on  List Name
//$10=List array name
//If you pass a number in $8 this will use a list in the system...if you pass this you do not need to pass $9 or $10
//$11 onwards
//IF YOU want to use an array pass the array name-not a pointer in $9--pass blank if not
//If you dont want to use a system list and want a list of values pass them in $10 to $10+n
//C_TEXT($11;$12;$13;$14;$15;$16;$17;$18;$19;$20;$21;$22;$23;;$24;$25;$26;$27;$28;$29;$30;$40)

IME_WebMessagesInit


<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
GEN_R_Amount:=0
GEN_l_Amount:=0
If (Count parameters:C259>1)
	vT:=$2
Else 
	vT:=""
End if 

If (IME_bo_FromWebRequest=False:C215)
	$_l_ScreenCentreVertical:=Screen width:C187/2
	$_l_FixedWIdth:=318
	$_l_ScreenCentreHorizontal:=Screen height:C188/2
	$_l_FIxedHeight:=101
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	If (Count parameters:C259<5)
		
		WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FIxedHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FIxedHeight/2)); 1987)
		
	Else 
		//$5=Centre
		//$6=middle
		If (Count parameters:C259<=6)
			If ($5=0) | ($6=0)  //Must pass both
				WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FIxedHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FIxedHeight/2)); 1987)
			Else 
				
				//Open window($5-(Int($_l_FixedWIdth/2));$6-(Int($_l_FIxedHeight/2));$5+(Int($_l_FixedWIdth/2));$6+(Int($_l_FIxedHeight/2));1985)
				WIN_l_CurrentWinRef:=Open window:C153($5; $6; $5+(Int:C8($_l_FixedWIdth)); $6+(Int:C8($_l_FIxedHeight)); 1985)
				
			End if 
		Else 
			If ($7#"")
				//allow for window title
				If ($5=0) | ($6=0)
					WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FIxedHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FIxedHeight/2)); 1987; $7)
				Else 
					//Open window($5-(Int($_l_FixedWIdth/2));$6-(Int($_l_FIxedHeight/2));$5+(Int($_l_FixedWIdth/2));$6+(Int($_l_FIxedHeight/2));1987;$7)
					WIN_l_CurrentWinRef:=Open window:C153($5; $6; $5+(Int:C8($_l_FixedWIdth)); $6+(Int:C8($_l_FIxedHeight)); 1987; $7)
				End if 
			Else 
				If ($5=0) | ($6=0)  //Must pass both
					WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FIxedHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FixedWIdth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FIxedHeight/2)); 1987)
				Else 
					
					//Open window($5-(Int($_l_FixedWIdth/2));$6-(Int($_l_FIxedHeight/2));$5+(Int($_l_FixedWIdth/2));$6+(Int($_l_FIxedHeight/2));1985)
					WIN_l_CurrentWinRef:=Open window:C153($5; $6; $5+(Int:C8($_l_FixedWIdth)); $6+(Int:C8($_l_FIxedHeight)); 1985)
				End if 
				
			End if 
			
		End if 
		
	End if 
	
	If (Count parameters:C259>2)
		<>ButtOK:=$3
		<>ButtCanc:=$4
	Else 
		<>ButtOK:=""
		<>ButtCanc:=""
	End if 
	ARRAY TEXT:C222(GEN_at_ComboBoxValues; 0)
	If (Count parameters:C259>=8)
		If ($8>0)
			ARRAY LONGINT:C221($_al_ListItemIDS; 0)
			ARRAY TEXT:C222($_at_ListItemNames; 0)  //note this is 55 characters
			AA_LoadListbyID($8; ->$_at_ListItemNames; ->$_al_ListItemIDS; False:C215)
			For ($_l_Index; 1; Size of array:C274($_at_ListItemNames))
				APPEND TO ARRAY:C911(GEN_at_ComboBoxValues; $_at_ListItemNames{$_l_Index})
			End for 
		Else 
			If (Count parameters:C259>=9)
				If ($9#"")
					ARRAY LONGINT:C221($_al_ListItemIDS; 0)
					ARRAY TEXT:C222($_at_ListItemNames; 0)  //note this is 55 characters
					AA_LoadListByName($9; ->$_at_ListItemNames; ->$_al_ListItemIDS; False:C215)
					//Note that the above will create the list if it does not exists..
					//here is there are more than 11 parameters we can make sure the list items in $11 are in that list
					For ($_l_Index; 1; Size of array:C274($_at_ListItemNames))
						APPEND TO ARRAY:C911(GEN_at_ComboBoxValues; $_at_ListItemNames{$_l_Index})
					End for 
					
				Else 
					If (Count parameters:C259>=10)
						If ($10#"")
							$_Ptr_ValuesArray:=Get pointer:C304($10)
							
							If (Not:C34(Is nil pointer:C315($_Ptr_ValuesArray)))  //Just to be safe
								//test the type here is string
								For ($_l_Index; 1; Size of array:C274($_Ptr_ValuesArray->))
									APPEND TO ARRAY:C911(GEN_at_ComboBoxValues; $_Ptr_ValuesArray->{$_l_Index})
								End for 
							End if 
						Else 
							If (Count parameters:C259>=11)
								For ($_l_Index; 11; Count parameters:C259)
									APPEND TO ARRAY:C911(GEN_at_ComboBoxValues; ${$_l_Index})
								End for 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	If (Size of array:C274(GEN_at_ComboBoxValues)>0)
		Gen_bo_UseComboBoxPage:=True:C214
	End if 
	DIALOG:C40([COMPANIES:2]; "dRequest")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	Gen_bo_UseComboBoxPage:=False:C215
	$0:=Str_StripDel(vT)
	<>SYS_bo_CurrentWindowModal:=False:C215
	
Else 
	IME_WebMessagesAddWarning("Request Warning"; "Warning. From the web, the system couldn't request from the user  the following."+".. '"+$1+".' Assumed the default value of '"+vT+"'.")
	OK:=0
End if 
ERR_MethodTrackerReturn("Gen Request"; $_t_oldMethodName)