//%attributes = {}
If (False:C215)
	//Project Method Name:      NC_IMA_GDProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SCPT_bo_AllowAdd; SCPT_bo_FirstTime)
	C_LONGINT:C283(Macro_From; Macro_MaxNum; Macro_Mshown; Macro_Mto_LONG; Macro_NO_LONG; Macro_No2_LONG; Macro_page)
	C_TEXT:C284(<>QUOTE; $_t_oldMethodName; IMA SDReReg; ITX GDHeader1; ITX GDHeading1; ITX SDSubhead1; ITX Table1; ITX Text1L; Macro_extra; Macro_GDPG; Macro_GDPrice)
	C_TEXT:C284(MACRO_max; Macro_Mrecords_TXT; Macro_mReply; Macro_mREply_TXT; Macro_Msort; Macro_MsortLinks; Macro_mSortTitle; Macro_mText; Macro_Prodbit; viSearch)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NC_IMA_GDProducts")
//Macro Code IMA GDProducts
COMPILER_MACROS

If (<>QUOTE="")
	<>Quote:=Char:C90(34)
End if 

SCPT_bo_AllowAdd:=True:C214
If ((viSearch="@&Page=@") | (viSearch="@&Sort=@"))
	Macro_page:=Num:C11(IME_Parameter("Page"))
	SCPT_bo_FirstTime:=False:C215
	Macro_Msort:=IME_Parameter("Sort")
	MACRO_max:=IME_Parameter("Max")
	Macro_NO_LONG:=Num:C11(IME_Parameter("No"))
	viSearch:=IME_Parameter("#1")  //set to just Order Code
Else 
	Macro_NO_LONG:=Records in selection:C76([PRODUCTS:9])
	Macro_page:=1
	SCPT_bo_FirstTime:=True:C214
End if 

If ([ORDERS:24]Person:5="WebR*")  //security check to see if have evaded Passwording themselves
	Macro_IMAPLAY(IMA SDReReg)
Else 
	
	//Set Price Group
	Macro_GDPG:=""
	Macro_GDPrice:=""
	QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=viSearch)
	RELATE ONE:C42([ORDERS:24]Contact_Code:2)
	Macro_GDPG:=FurthFld_Get("Contacts"; "GOLD Member")
	
	//Set Price Group ends
	
	QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=viSearch)
	If ((Macro_NO_LONG>0) & ([ORDERS:24]Order_Code:3#""))
		
		If (MACRO_max="")
			MACRO_max:="10"  //default number of returned Products
		End if 
		Macro_MaxNum:=Num:C11(MACRO_max)
		
		If (Macro_Msort="New@")
			Macro_Msort:=Substring:C12(Macro_Msort; 4; 99)
			SCPT_bo_FirstTime:=IME_ListLoad("Products"; viSearch)
		End if 
		
		Macro_From:=((Macro_page-1)*Macro_MaxNum)+1
		Macro_Mto_LONG:=Macro_page*Macro_MaxNum
		If (Macro_Mto_LONG>Macro_NO_LONG)
			Macro_Mto_LONG:=Macro_NO_LONG
		End if 
		Macro_Mshown:=Macro_Mto_LONG-Macro_From+1
		Macro_No2_LONG:=Macro_From+Macro_Mshown
		
		If (SCPT_bo_FirstTime)
			Case of 
				: (Macro_Msort="1")
					ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2; >)
				: (Macro_Msort="2")
					ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Sales_Price:9; >)
				: (Macro_Msort="3")
					ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Sales_Price:9; <)
			End case 
			Macro_Mrecords_TXT:="First "+String:C10(Macro_Mto_LONG)
		Else 
			Macro_Mrecords_TXT:=String:C10(Macro_From)+" to "+String:C10(Macro_Mto_LONG)
		End if 
		If ((Macro_Mto_LONG-Macro_From)=0)
			Macro_extra:=" - Item "+String:C10(Macro_From)
		Else 
			Macro_extra:=" - Items "+String:C10(Macro_From)+" to "+String:C10(Macro_Mto_LONG)
		End if 
		
		Case of 
			: (Macro_Msort="1")
				Macro_MsortLinks:="<*ITX A1Cont("
				Macro_MsortLinks:=Macro_MsortLinks+<>Quote+"GDProdSame?"
				Macro_MsortLinks:=Macro_MsortLinks+viSearch+"&Page=1&Sort=New2&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO_LONG)+<>Quote
				Macro_MsortLinks:=Macro_MsortLinks+")*>Sort by Price (Ascending)</A>&nbsp;&nbsp;&nbsp;<*ITX A1Cont("+<>Quote+"GDProdSame?"+viSearch+"&Page=1&Sort=New3&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO_LONG)+<>Quote
				Macro_MsortLinks:=Macro_MsortLinks+")*>Sort by Price (Descending)</A>"
				
				Macro_mSortTitle:=" - Sorted by Title"
			: (Macro_Msort="2")
				Macro_MsortLinks:="<*ITX A1Cont("+<>Quote+"GDProdSame?"+viSearch+"&Page=1&Sort=New1&Max="+MACRO_max+"&No="+String:C10(Macro_NO_LONG)+<>Quote+")*>Sort by Title</A>&nbsp;&nbsp;&nbsp;<*ITX A1Cont("+<>Quote+"GDProdSame?"+viSearch+"&Page=1&Sort=New3&Max="+MACRO_max+"&No="+String:C10(Macro_NO_LONG)+<>Quote+")*>Sort by Price (Descending)</A>"
				Macro_mSortTitle:=" - Sorted by Price(Ascending)"
			: (Macro_Msort="3")
				Macro_MsortLinks:="<*ITX A1Cont("
				Macro_MsortLinks:=Macro_MsortLinks+<>Quote+"GDProdSame?"
				Macro_MsortLinks:=Macro_MsortLinks+viSearch+"&Page=1&Sort=New1&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO_LONG)+<>Quote
				Macro_MsortLinks:=Macro_MsortLinks+")*>Sort by Title</A>&nbsp;&nbsp;&nbsp;<*ITX A1Cont("+<>Quote+"GDProdSame?"+viSearch+"&Page=1&Sort=New1&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO_LONG)+<>Quote
				Macro_MsortLinks:=Macro_MsortLinks+")*>>Sort by Price (Ascending)</A>"
				
				Macro_mSortTitle:=" - Sorted by Price(Descending)"
			Else 
				Macro_MsortLinks:="<*ITX A1Cont("
				Macro_MsortLinks:=Macro_MsortLinks+<>Quote+"GDProdSame?"
				Macro_MsortLinks:=Macro_MsortLinks+viSearch+"&Page=1&Sort=New1&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO_LONG)+<>Quote
				Macro_MsortLinks:=Macro_MsortLinks+")*>Sort by Title</A>&nbsp;&nbsp;&nbsp;<*ITX A1Cont("
				Macro_MsortLinks:=Macro_MsortLinks+<>Quote+"GDProdSame?"
				Macro_MsortLinks:=Macro_MsortLinks+viSearch+"&Page=1&Sort=New2&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO_LONG)+<>Quote
				Macro_MsortLinks:=Macro_MsortLinks+")*>Sort by Price (Ascending)</A>"
				Macro_MsortLinks:=Macro_MsortLinks+"& NBSP ; & NBSP ; & NBSP ;<*ITX A1Cont("
				Macro_MsortLinks:=Macro_MsortLinks+<>Quote+"GDProdSame<*ITX A1Cont("
				Macro_MsortLinks:=Macro_MsortLinks+<>Quote+"GDProdSame?"
				Macro_MsortLinks:=Macro_MsortLinks+viSearch+"&Page=1&Sort=New3&Max="
				Macro_MsortLinks:=Macro_MsortLinks+MACRO_max+"&No="
				Macro_MsortLinks:=Macro_MsortLinks+String:C10(Macro_NO)+<>Quote+")*>Sort by Price (Descending)</A>"
				Macro_mSortTitle:=""
		End case 
		
		Macro_ITXPLAY(ITX GDHeader1)
		Macro_ITXPLAY(ITX GDHeading1)
		Macro_ITXPLAY(ITX SDSubhead1)
		IME_Flush
		
		If (Not:C34(Undefined:C82(Macro_Prodbit)))
			Macro_Reply("*<!--<*mProdbit*>-->")
			
		End if 
		Macro_ITXPLAY(ITX Table1)
		Macro_ITXPLAY(ITX Text1L)
		If (SCPT_bo_AllowAdd=False:C215)  //change to Country code
			
			Macro_mReply:="*Click on a <B>Title</B> for more information.  Note that you will need to "
			Macro_mReply:=Macro_mReply+"Register before you can add items to a Shopping Basket."
			Macro_Reply(Macro_mREply)
			
		Else 
			Macro_mREply_TXT:="*Click on a<B>Title</B>for more information.  To"
			Macro_mREply_TXT:=Macro_mREply_TXT+"<B>Add</B>items to your<B>Shopping Basket</B>click on the"
			Macro_mREply_TXT:=Macro_mREply_TXT+"<B>Check Box</B> •to the left then press the"
			Macro_mREply_TXT:=Macro_mREply_TXT+"<B>Add Items</B>button at the base of the screen"
			Macro_mREply_TXT:=Macro_mREply_TXT+"<B>Quantities</B>and remove items again."
			Macro_Reply(Macro_mReply_TXT)
		End if 
		If ([ORDERS:24]Tax_Rate:34#0)
			Macro_mREply_TXT:=String:C10([ORDERS:24]Tax_Rate:34; " | Percent")
			Macro_Reply("*<B>  Prices include Tax at <*"+Macro_mREply_TXT+"*><B>.")
		End if 
		Macro_ITXPLAY("ITX Text/")
		Macro_ITXPLAY("ITX Table1/")
		
		Macro_ITXPLAY("ITX Table1")
		Macro_ITXPLAY("ITX SDForm1")
		Macro_ITXPLAY("ITX SDV5ColNL")
		Macro_ITXPLAY("ITX SDTableHRx")
		
		If (SCPT_bo_AllowAdd=False:C215)
			Macro_ITXPLAY("ITX GD5ColNoCB")
		Else 
			Macro_ITXPLAY("ITX GD5ColCB")
		End if 
		
		Macro_ITXPLAY("ITX SDTableHRx")
		
		//show the Add Items button
		Macro_ITXPLAY("ITX SDTextxC")
		If (SCPT_bo_AllowAdd)
			Macro_ITXPLAY("ITX GDButtImg")
			Macro_Reply("* & NBSP ; & NBSP ;")
		End if 
		Macro_ITXPLAY("ITX SDText/")
		
		If (Macro_NO_LONG>Macro_MaxNum)  //add on the next and previous page links
			Macro_mText:=""
			If (Macro_page>1)
				Macro_mText:=Macro_mText+"<*ITX A1Cont("+<>Quote+"GDProdSame?"+viSearch+"&Page="+String:C10(Macro_page-1)+"&Sort="+Macro_Msort+"&Max="+MACRO_max+"&No="+String:C10(Macro_NO_LONG)+<>Quote+")*>Show Items "+String:C10(Macro_From-Macro_MaxNum)+" to "+String:C10(Macro_From-1)+"</A>"
			End if 
			If (Macro_No2_LONG<=Macro_NO_LONG)
				Macro_mText:=Macro_mText+("&nbsp;     &nbsp;"*Num:C11(Macro_mText#""))+"<*ITX A1Cont("+<>Quote+"GDProdSame?"+viSearch+"&Page="+String:C10(Macro_page+1)+"&Sort="+Macro_Msort+"&Max="+MACRO_max+"&No="+String:C10(Macro_NO_LONG)+<>Quote+")*>"
				Macro_Mto_LONG:=Macro_From+Macro_MaxNum+Macro_MaxNum-1
				If (Macro_Mto_LONG>Macro_NO_LONG)
					Macro_Mto_LONG:=Macro_NO_LONG
				End if 
				If (Macro_Mto_LONG=(Macro_From+Macro_MaxNum))
					Macro_mText:=Macro_mText+"Show Item "+String:C10(Macro_Mto_LONG)+"</A>"
				Else 
					Macro_mText:=Macro_mText+"Show Items "+String:C10(Macro_From+Macro_MaxNum)+" to "+String:C10(Macro_Mto_LONG)+"</A>"
				End if 
				
			End if 
			If (Macro_mText#"")
				Macro_ITXPLAY("ITX SDTextxC")
				Macro_Reply("*<*mText*>")
				Macro_ITXPLAY("ITX SDText/")
			End if 
			
		End if 
		
		Macro_ITXPLAY("ITX SDTextxC")
		Macro_Reply("*<*mSortLinks*>")
		Macro_ITXPLAY("ITX SDText/")
		
		Macro_ITXPLAY("ITX SDTable1/")
		Macro_ITXPLAY("ITX SDForm1/")
		Macro_ITXPLAY("ITX GDFooter1")
		
	Else 
		Macro_ITXPLAY("ITX GDHeader1")
		Macro_ITXPLAY("ITX GDHeading1")
		Macro_ITXPLAY("ITX SDSubhead1")
		Macro_ITXPLAY("ITX Table1")
		Macro_ITXPLAY("ITX Text1L")
		Macro_ITXPLAY("ITX FontAH4")
		Macro_Reply("*No Products Found</FONT>")
		Macro_ITXPLAY("ITX Text/")
		Macro_ITXPLAY("ITX SDTableHR")
		Macro_ITXPLAY("ITX Text1L")
		Macro_mREply_TXT:="*Please press the<B>Back</B>button to enter different search"
		Macro_mREply_TXT:=Macro_mREply_TXT+"criteria, or use the QuickFind box. Alternatively send an email to"
		Macro_mREply_TXT:=Macro_mREply_TXT+"<B><*ITX SDMailTo("
		Macro_mREply_TXT:=Macro_mREply_TXT+<>Quote+"wokane@shopsdirect.com"+<>Quote
		Macro_mREply_TXT:=Macro_mREply_TXT+"*>wokane@shopsdirect.com</A></B> and tell us"
		Macro_mREply_TXT:=Macro_mREply_TXT+"what product(s) you are looking for. We will do our best to find the product"
		Macro_mREply_TXT:=Macro_mREply_TXT+"quickly and at the best price."
		Macro_Reply(Macro_mREply_TXT)
		Macro_ITXPLAY("ITX Text/")
		Macro_ITXPLAY("ITX Table1/")
		Macro_ITXPLAY("ITX HR90")
		Macro_ITXPLAY("ITX GDFooter1")
	End if 
	
End if 
IME_Unload
ERR_MethodTrackerReturn("NC_IMA_GDProducts"; $_t_oldMethodName)