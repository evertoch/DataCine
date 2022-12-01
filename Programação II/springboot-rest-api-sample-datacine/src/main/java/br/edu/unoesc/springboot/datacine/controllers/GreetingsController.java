package br.edu.unoesc.springboot.datacine.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import br.edu.unoesc.springboot.datacine.model.Filme;
import br.edu.unoesc.springboot.datacine.repository.FilmeRepository;

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
       
    
    @GetMapping(value="listatodos")	
    @ResponseBody
     public ResponseEntity<List<Filme>>listaFilme(){
     	List<Filme> filme = filmeRepository.findAll();
     	return new ResponseEntity<List<Filme>>(filme, HttpStatus.OK) ;
     }
    
    @DeleteMapping(value = "delete")
	@ResponseBody
	public ResponseEntity<String> deletefilme(@RequestParam Long idfilme) {
		filmeRepository.deleteById(idfilme);
		return new ResponseEntity<String>("Filme excluido com sucesso", HttpStatus.OK);
	}
    
    @GetMapping(value = "buscaruserid")
	@ResponseBody
	public ResponseEntity<Filme> buscarfilmeid(@RequestParam(name = "idfilme") Long idfilme){
		Filme filme = filmeRepository.findById(idfilme).get();
		return new ResponseEntity<Filme>(filme, HttpStatus.OK);
	}
    

    /* 
     ***********  FILME   ***********
     */

    @Autowired // injeção de dependência
	private FilmeRepository filmeRepository;
 
    	
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
	
	
}

