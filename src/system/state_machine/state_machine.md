# O que são Máquinas de Estados?

**Maquinas de Estados** são uma forma de programar comportamentos complexos, reduzindo a quantidade de condições (if), para isso o estado atual, limita o que pode ocorrer naquele momento.

Regras básicas das maquinas de estados:
	
1. Máquinas de estados tem uma quantia finida de estados possíveis;
2. Cada estado aciona certos eventos, fazendo com que a máquina mude de estado;

StateMachine

- controlled_node = self.owner
> pega a referencia do node a ser controlado

+ default_sate: SateBase
> define o estado inicial da máquina

- current_state: StateBase = null
> define o estado em execução em cada momento
