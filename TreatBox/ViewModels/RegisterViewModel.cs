using System.ComponentModel.DataAnnotations;

namespace TreatBox.ViewModels
{

    public class RegisterViewModel{
      [Required]
      [EmailAddress]
      [Display(Name="email")]
      public string Email {get; set;}

      [Required]
      [DataType(DataType.Password)]
      [Display(Name="password")]
      public string Password {get; set;}

      [DataType(DataType.Password)]
      [Display(Name="Confirm password")]
      [Compare("Password", ErrorMessage="Not a matching pswd")]
      public string ConfirmPassword {get; set;}
    }
}