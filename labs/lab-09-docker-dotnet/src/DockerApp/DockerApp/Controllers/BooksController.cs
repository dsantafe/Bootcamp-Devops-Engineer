using Microsoft.AspNetCore.Mvc;

namespace DockerApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BooksController : ControllerBase
    {
        private readonly List<Book> _books;
        private readonly ILogger<BooksController> _logger;

        public BooksController(ILogger<BooksController> logger)
        {
            _logger = logger;

            _books = new List<Book>
            {
                new() { Id = 1, Title = "Don Quijote de la Mancha", PublicationDate = 1605, Sales =  500},
                new() { Id = 2, Title = "Historia de dos ciudades", PublicationDate = 1859, Sales = 200 },
                new() { Id = 3, Title = "El Señor de los Anillos", PublicationDate = 1978, Sales = 150 },
                new() { Id = 4, Title = "El principito", PublicationDate = 1951, Sales = 140 },
                new() { Id = 5, Title = "El hobbit", PublicationDate = 1982, Sales = 100 },
                new() { Id = 6, Title = "Sueño en el pabellón rojo", PublicationDate = 1792, Sales = 100 },
                new() { Id = 7, Title = "Las aventuras de Alicia en el país de las maravillas", PublicationDate = 1865, Sales = 100 },
                new() { Id = 8, Title = "Diez negritos", PublicationDate = 1939, Sales = 100 },
                new() { Id = 9, Title = "El león, la bruja y el armario", PublicationDate = 1950, Sales = 85 },
                new() { Id = 10, Title = "El código Da Vinci", PublicationDate = 2003, Sales = 80 },
                new() { Id = 11, Title = "El guardián entre el centeno", PublicationDate = 1951, Sales = 65 },
                new() { Id = 12, Title = "El alquimista", PublicationDate = 1988, Sales = 65 },
            };
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_books);
        }
    }
}