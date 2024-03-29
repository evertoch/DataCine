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
import br.edu.unoesc.springboot.datacine.model.Ingresso;
import br.edu.unoesc.springboot.datacine.model.Sala;
import br.edu.unoesc.springboot.datacine.model.Sessao;
import br.edu.unoesc.springboot.datacine.repository.FilmeRepository;
import br.edu.unoesc.springboot.datacine.repository.IngressoRepository;
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
       
	

 
//------------------------- FILME ------------------------- FILME ------------------------- FILME ------------------------- FILME -------------------------


    @Autowired // injeção de dependência
	private FilmeRepository filmeRepository;
    
    	
	@PostMapping(value = "salvarJSONFilme")
	@ResponseBody
	public ResponseEntity<Filme> salvarJSONFilme(@RequestBody Filme filme) {
		Filme fil = filmeRepository.save(filme);
		return new ResponseEntity<Filme>(fil, HttpStatus.CREATED);
	}
	
	@DeleteMapping(value = "deletarFilmeId")
	@ResponseBody
	public ResponseEntity<String> deletarFilmeId(@RequestParam Long idfilme) {
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

 //------------------------- SALA ------------------------- SALA ------------------------- SALA ------------------------- SALA -------------------------
    
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
    
	@DeleteMapping(value = "deletarSalaId")
	@ResponseBody
	public ResponseEntity<String> deletarSalaId(@RequestParam Long idsala) {
		salaRepository.deleteById(idsala);
		return new ResponseEntity<String>("Sala excluída com sucesso!", HttpStatus.OK);
	}
    
//------------------------- SESSÃO ------------------------- SESSÃO ------------------------- SESSÃO ------------------------- SESSÃO -------------------------

    
    @Autowired // injeção de dependência
   	private SessaoRepository sessaoRepository;
    
	
    @GetMapping(value = "buscarSessaoNome")
	@ResponseBody
	public ResponseEntity<List<Sessao>>buscarSessaoNome(@RequestParam(name = "nome") String nome){
		List<Sessao> sessao = sessaoRepository.sessaoByName(nome.trim().toUpperCase());
		return new ResponseEntity<List<Sessao>>(sessao, HttpStatus.OK);
    }
	    
	@PostMapping(value = "salvarSessao")
	@ResponseBody
	public ResponseEntity<Sessao> salvarSessao(@RequestBody Sessao sessao) {
		Sessao sessa= sessaoRepository.save(sessao);
		return new ResponseEntity<Sessao>(sessa, HttpStatus.CREATED);
	}
		
	@GetMapping(value = "buscarSessaoId")
	@ResponseBody
	public ResponseEntity<Sessao> buscarSessaoId(@RequestParam(name = "idsessao") Long idsessao){
		Sessao sessao = sessaoRepository.findById(idsessao).get();
		return new ResponseEntity<Sessao>(sessao, HttpStatus.OK);	
	}
	
	@DeleteMapping(value = "deletarSessaoId")
	@ResponseBody
	public ResponseEntity<String> deletarSessaoId(@RequestParam Long idsessao) {
		sessaoRepository.deleteById(idsessao);
		return new ResponseEntity<String>("Sessão excluída com sucesso!", HttpStatus.OK);
	}
	
//------------------------- INGRESSO ------------------------- INGRESSO ------------------------- INGRESSO ------------------------- INGRESSO -------------------------
    
	@Autowired // injeção de dependência
   	private IngressoRepository ingressoRepository;
	
	@PostMapping(value = "salvarIngresso")
	@ResponseBody
	public ResponseEntity<Ingresso> salvarIngresso(@RequestBody Ingresso ingresso) {
		Ingresso ingress = ingressoRepository.save(ingresso);
		return new ResponseEntity<Ingresso>(ingress, HttpStatus.CREATED);	
	}
	
	@DeleteMapping(value = "deletarIngressoId")
	@ResponseBody
	public ResponseEntity<String> deletarIngressoId(@RequestParam Long idingresso) {
		ingressoRepository.deleteById(idingresso);
		return new ResponseEntity<String>("Ingresso excluído com sucesso!", HttpStatus.OK);
	}
	
	@GetMapping(value = "buscarIngressoId")
	@ResponseBody
	public ResponseEntity<Ingresso> buscarIngressoId(@RequestParam(name = "idingresso") Long idingresso){
		Ingresso ingresso = ingressoRepository.findById(idingresso).get();
		return new ResponseEntity<Ingresso>(ingresso, HttpStatus.OK);	
	}
	
    @GetMapping(value = "buscarIngressoNome")
	@ResponseBody
	public ResponseEntity<List<Ingresso>>buscarIngressoNome(@RequestParam(name = "nomfil") String nomfil){
		List<Ingresso> ingresso = ingressoRepository.ingressoByName(nomfil.trim().toUpperCase());
		return new ResponseEntity<List<Ingresso>>(ingresso, HttpStatus.OK);
	
    }

    
    
}


