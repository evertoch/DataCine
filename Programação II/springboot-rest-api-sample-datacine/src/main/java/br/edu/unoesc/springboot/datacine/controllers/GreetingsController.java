package br.edu.unoesc.springboot.datacine.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.edu.unoesc.springboot.datacine.model.Filme;
import br.edu.unoesc.springboot.datacine.model.Sala;
import br.edu.unoesc.springboot.datacine.model.Sessao;
import br.edu.unoesc.springboot.datacine.repository.FilmeRepository;
import br.edu.unoesc.springboot.datacine.repository.SalaRepository;
import br.edu.unoesc.springboot.datacine.repository.SessaoRepository;

/**
 *
 * A sample greetings controller to return greeting text
 */
@RestController
public class GreetingsController {
    /**
     *
     * @param name the name to greet
     * @return greeting text
     */
       
	
//	**************** END POINT TESTE *******************
	
	@RequestMapping(value = "/oi", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String greetingText() {
        return "Hello World! Começa aqui o projeto DataCine...";
    }

 
//   **************** FILME  *******************


    @Autowired // injeção de dependência
	private FilmeRepository filmeRepository;
    
    @GetMapping(value="listarTodosFilmes")	
    @ResponseBody
     public ResponseEntity<List<Filme>>listaFilme(){
     	List<Filme> filme = filmeRepository.findAll();
     	return new ResponseEntity<List<Filme>>(filme, HttpStatus.OK) ;
     }
    	
	@PostMapping(value = "salvarJSONFilme")
	@ResponseBody
	public ResponseEntity<Filme> salvarJSONFilme(@RequestBody Filme filme) {
		Filme fil = filmeRepository.save(filme);
		return new ResponseEntity<Filme>(fil, HttpStatus.CREATED);
	}
	
	@DeleteMapping(value = "deletarFilmeID")
	@ResponseBody
	public ResponseEntity<String> deletarFilmeID(@RequestParam Long idfilme) {
		filmeRepository.deleteById(idfilme);
		return new ResponseEntity<String>("Filme excluído com sucesso!", HttpStatus.OK);
	}
	
	@GetMapping(value = "buscarFilmeId")
	@ResponseBody
	public ResponseEntity<Filme> buscarFilmeId(@RequestParam(name = "idfilme") Long idfilme){
		Filme filme = filmeRepository.findById(idfilme).get();
		return new ResponseEntity<Filme>(filme, HttpStatus.OK);
	}		

    @GetMapping(value = "buscarFilmeNome")
	@ResponseBody
	public ResponseEntity<List<Filme>>buscarFilmeNome(@RequestParam(name = "nome") String nome){
		List<Filme> filme = filmeRepository.filmeByName(nome.trim().toUpperCase());
		return new ResponseEntity<List<Filme>>(filme, HttpStatus.OK);
	}	

//  **************** SALA  *******************
    
    @Autowired // injeção de dependência
   	private SalaRepository salaRepository;
    
	@GetMapping(value = "buscarSalaId")
	@ResponseBody
	public ResponseEntity<Sala> buscarSalaId(@RequestParam(name = "idsala") Long idsala){
		Sala sala = salaRepository.findById(idsala).get();
		return new ResponseEntity<Sala>(sala, HttpStatus.OK);
	}
	
	@PostMapping(value = "salvarSala")
	@ResponseBody
	public ResponseEntity<Sala> salvarSala(@RequestBody Sala sala) {
		Sala sal= salaRepository.save(sala);
		return new ResponseEntity<Sala>(sal, HttpStatus.CREATED);
	}
	
    @GetMapping(value = "buscarSalaNome")
	@ResponseBody
	public ResponseEntity<List<Sala>>buscarSalaNome(@RequestParam(name = "nome") String nome){
		List<Sala> sala = salaRepository.salaByName(nome.trim().toUpperCase());
		return new ResponseEntity<List<Sala>>(sala, HttpStatus.OK);
    }
    
	@DeleteMapping(value = "deletarSalaID")
	@ResponseBody
	public ResponseEntity<String> deletarSalaID(@RequestParam Long idsala) {
		salaRepository.deleteById(idsala);
		return new ResponseEntity<String>("Sala excluída com sucesso!", HttpStatus.OK);
	}
    
//  **************** SESSAO  *******************
    
    @Autowired // injeção de dependência
   	private SessaoRepository sessaoRepository;
	
	@GetMapping(value = "buscarSessaoId")
	@ResponseBody
	public ResponseEntity<Sessao> buscarSessaoId(@RequestParam(name = "idsessao") Long idsessao){
		Sessao sessao= sessaoRepository.findById(idsessao).get();
		return new ResponseEntity<Sessao>(sessao, HttpStatus.OK);
	}
	

    
}

