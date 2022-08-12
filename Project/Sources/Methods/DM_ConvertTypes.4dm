//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_ConvertTypes
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
	C_LONGINT:C283($_l_FIeldNumber; $_l_Row)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2)
	C_REAL:C285($2; $3; $5; $6)
	C_TEXT:C284($_t_oldMethodName; $1; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ConvertTypes")

//this method will convert data types
$_t_oldMethodName:=ERR_MethodTracker("DM_ConvertTypes")
Case of 
	: ($2=0)
		//source is alpha(less than 80)
		Case of 
			: ($3=0)
				//do nothing
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_aT_"+$4+"_text")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=$_ptr_Variable2->{$5}
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_text")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=$_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}
				End if 
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=Num:C11($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=Int:C8(Num:C11($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8(Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=Int:C8(Num:C11($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8(Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=Date:C102($_ptr_Variable2->{$5})
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Date:C102($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=Time:C179($_ptr_Variable2->{$5})
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time:C179($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})="TRUE") | (($_ptr_Variable2->{$5})="1")
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})="TRUE") | (($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})="1")
				End if 
		End case 
	: ($2=2)  //text
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=Substring:C12($_ptr_Variable2->{$5}; 1; 255)
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Substring:C12(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}); 1; 255)
				End if 
			: ($3=2)  //Output text
				//do nothing
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=Num:C11($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=Int:C8(Num:C11($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8(Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=Int:C8(Num:C11($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8(Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=Date:C102($_ptr_Variable2->{$5})
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Date:C102($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=Time:C179($_ptr_Variable2->{$5})
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time:C179($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})="TRUE") | (($_ptr_Variable2->{$5})="1")
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})="TRUE") | (($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})="1")
				End if 
		End case 
		
	: ($2=1)  //REal
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Substring:C12(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}); 1; 255)
				End if 
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=String:C10(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=1)  //output Real
				
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable->{$5}:=Int:C8($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable->{$5}:=Int:C8($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					//mmm
					//its agreed by us(Pat, Bal and myself)
					//that turning a number into a date is not reliably possible
					//so this would need a sub function
					//relative to source
					If (False:C215)
						$_ptr_Variable->{$5}:=Date:C102($_ptr_Variable2->{$5})
					Else 
						$_ptr_Variable->{$5}:=!00-00-00!
					End if 
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					If (False:C215)
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Date:C102($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
					Else 
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=!00-00-00!
					End if 
				End if 
				
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable->{$5}:=Time:C179(Time string:C180($_ptr_Variable2->{$5}))
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time:C179(Time string:C180($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})>0)
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})>0)
				End if 
		End case 
	: ($2=8)  //integer
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Substring:C12(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}); 1; 255)
				End if 
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=String:C10(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable->{$5}:=($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_Integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
			: ($3=8)  //integer
				
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable->{$5}:=Int:C8($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					//mmm
					//its agreed by us(Pat, Bal and myself)
					//that turning a number into a date is not reliably possible
					//so this would need a sub function
					//relative to source
					If (False:C215)
						$_ptr_Variable->{$5}:=Date:C102($_ptr_Variable2->{$5})
					Else 
						$_ptr_Variable->{$5}:=!00-00-00!
					End if 
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					If (False:C215)
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Date:C102($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
					Else 
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=!00-00-00!
					End if 
				End if 
				
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable->{$5}:=Time:C179(Time string:C180($_ptr_Variable2->{$5}))
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time:C179(Time string:C180($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})>0)
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})>0)
				End if 
		End case 
	: ($2=9)  //long
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Substring:C12(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}); 1; 255)
				End if 
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=String:C10(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable->{$5}:=($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable->{$5}:=Int:C8($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Int:C8($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
				
			: ($3=9)  //long
				//`
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					//mmm
					//its agreed by us(Pat, Bal and myself)
					//that turning a number into a date is not reliably possible
					//so this would need a sub function
					//relative to source
					If (False:C215)
						$_ptr_Variable->{$5}:=Date:C102($_ptr_Variable2->{$5})
					Else 
						$_ptr_Variable->{$5}:=!00-00-00!
					End if 
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					If (False:C215)
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Date:C102($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
					Else 
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=!00-00-00!
					End if 
				End if 
				
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable->{$5}:=Time:C179(Time string:C180($_ptr_Variable2->{$5}))
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time:C179(Time string:C180($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})>0)
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})>0)
				End if 
		End case 
	: ($2=4)  //date
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=String:C10(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=String:C10($_ptr_Variable2->{$5})
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=String:C10(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber}))
				End if 
				
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=0
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=0
				End if 
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=0
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=0
				End if 
				
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=0
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=0
				End if 
				
			: ($3=4)  //date
				
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=?00:00:00?
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=?00:00:00?
				End if 
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_ptr_Variable->{$5}:=False:C215
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ad_"+$4+"_date")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=False:C215
				End if 
		End case 
	: ($2=11)  //time
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=Time string:C180($_ptr_Variable2->{$5}*1)
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time string:C180(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})*1)
				End if 
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=Time string:C180(($_ptr_Variable2->{$5})*1)
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Time string:C180(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})*1)
				End if 
				
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})*1)
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})*1)
				End if 
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})*1)
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})*1)
				End if 
				
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=(($_ptr_Variable2->{$5})*1)
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=(($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})*1)
				End if 
				
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=!00-00-00!
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=!00-00-00!
				End if 
			: ($3=11)  //time
				
			: ($3=6)  //boolean
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable->{$5}:=False:C215
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=False:C215
				End if 
		End case 
	: ($2=6)  //boolean
		Case of 
			: ($3=0)  //output string(255)
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					If ($_ptr_Variable2->{$5})
						$_ptr_Variable->{$5}:="TRUE"
					Else 
						$_ptr_Variable->{$5}:="FALSE"
					End if 
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Strings")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					If ($_ptr_Variable2->{$5})
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:="TRUE"
					Else 
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:="FALSE"
					End if 
					
				End if 
			: ($3=2)  //Output text
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					If ($_ptr_Variable2->{$5})
						$_ptr_Variable->{$5}:="TRUE"
					Else 
						$_ptr_Variable->{$5}:="FALSE"
					End if 
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_at_"+$4+"_Text")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					
					If ($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:="TRUE"
					Else 
						$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:="FALSE"
					End if 
				End if 
				
			: ($3=1)  //output Real
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ar_"+$4+"_Real")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable->{$5}:=Num:C11(($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
					
				End if 
			: ($3=8)  //integer
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable->{$5}:=Num:C11(($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ai_"+$4+"_integer")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
					
				End if 
				
				
			: ($3=9)  //long
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable->{$5}:=Num:C11(($_ptr_Variable2->{$5}))
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_al_"+$4+"_Longint")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=Num:C11($_ptr_Variable2->{$_l_Row}{$_l_FIeldNumber})
				End if 
				
			: ($3=4)  //date
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable->{$5}:=!00-00-00!
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ad_"+$4+"_Date")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=!00-00-00!
				End if 
			: ($3=11)  //time
				If ($5>0)
					//one dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_ptr_Variable->{$5}:=?00:00:00?
					
					
				Else 
					//two dimension
					$_ptr_Variable:=Get pointer:C304($1+"_ati_"+$4+"_Time")
					$_ptr_Variable2:=Get pointer:C304($1+"_abo_"+$4+"_Boolean")
					$_l_Row:=$6
					$_l_FIeldNumber:=Abs:C99($5)
					$_ptr_Variable->{$_l_Row}{$_l_FIeldNumber}:=?00:00:00?
				End if 
				
			: ($3=6)  //boolean
				
		End case 
End case 
ERR_MethodTrackerReturn("DM_ConvertTypes"; $_t_oldMethodName)