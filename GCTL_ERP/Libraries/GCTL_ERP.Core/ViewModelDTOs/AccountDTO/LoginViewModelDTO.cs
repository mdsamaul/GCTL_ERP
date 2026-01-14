using System.ComponentModel.DataAnnotations;

namespace GCTL_ERP.Core.ViewModelDTOs.AccountDTO
{
    public class LoginViewModelDTO
    {
        [Required(ErrorMessage = "ইমেইল আবশ্যক")]
        [EmailAddress]
        [Display(Name = "ইমেইল")]
        public string Email { get; set; }

        [Required(ErrorMessage = "পাসওয়ার্ড আবশ্যক")]
        [DataType(DataType.Password)]
        [Display(Name = "পাসওয়ার্ড")]
        public string Password { get; set; }

        [Display(Name = "আমাকে মনে রাখুন")]
        public bool RememberMe { get; set; }
    }
}
